/// 资产列表页面
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/asset.dart';
import '../../providers/asset_providers.dart';

class AssetsListPage extends ConsumerStatefulWidget {
  const AssetsListPage({super.key});

  @override
  ConsumerState<AssetsListPage> createState() => _AssetsListPageState();
}

class _AssetsListPageState extends ConsumerState<AssetsListPage> {
  bool _isSearching = false;
  final _searchController = TextEditingController();
  String _searchQuery = '';
  AssetType? _filterType;
  AssetStatus? _filterStatus;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final assetsAsync = ref.watch(assetsProvider);

    return Scaffold(
      appBar: AppBar(
        title: _isSearching
            ? TextField(
                controller: _searchController,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: '搜索资产...',
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  setState(() => _searchQuery = value);
                },
              )
            : const Text('资产记录'),
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
                if (!_isSearching) {
                  _searchController.clear();
                  _searchQuery = '';
                }
              });
            },
          ),
          if (!_isSearching)
            IconButton(
              icon: Icon(_filterType != null || _filterStatus != null
                  ? Icons.filter_list
                  : Icons.filter_list_outlined),
              onPressed: () => _showFilterDialog(context),
            ),
        ],
      ),
      body: assetsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('加载失败: $e')),
        data: (assets) {
          var filteredAssets = assets;
          // 筛选类型
          if (_filterType != null) {
            filteredAssets = filteredAssets.where((a) => a.type == _filterType).toList();
          }
          // 筛选状态
          if (_filterStatus != null) {
            filteredAssets = filteredAssets.where((a) => a.status == _filterStatus).toList();
          }
          // 搜索过滤
          if (_searchQuery.isNotEmpty) {
            filteredAssets = filteredAssets.where((a) =>
              a.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
              a.tags.any((t) => t.toLowerCase().contains(_searchQuery.toLowerCase())) ||
              (a.subCategory?.toLowerCase().contains(_searchQuery.toLowerCase()) ?? false) ||
              (a.note?.toLowerCase().contains(_searchQuery.toLowerCase()) ?? false)
            ).toList();
          }
          return _buildAssetList(context, filteredAssets);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToAddAsset(context),
        child: const Icon(Icons.add),
      ),
    );
  }
  
  Widget _buildAssetList(BuildContext context, List<Asset> assets) {
    if (assets.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.account_balance_wallet, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              '暂无资产记录',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 8),
            Text(
              '点击右下角按钮添加',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
    }
    
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: assets.length,
      itemBuilder: (context, index) => _buildAssetCard(context, assets[index]),
    );
  }
  
  Widget _buildAssetCard(BuildContext context, Asset asset) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () => _navigateToAssetDetail(context, asset),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          asset.name,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${asset.type.label}${asset.subCategory != null ? ' · ${asset.subCategory}' : ''}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: _getStatusColor(asset.status),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      asset.status.label,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  _buildCostTag(context, '购入', asset.purchasePrice),
                  if (asset.currentValue != null && asset.currentValue != asset.purchasePrice)
                    _buildCostTag(context, '估值', asset.currentValue!),
                  if (asset.sellPrice != null)
                    _buildCostTag(context, '卖出', asset.sellPrice!),
                ],
              ),
              if (asset.type == AssetType.subscription)
                _buildSubscriptionInfo(context, asset),
              if (asset.type == AssetType.physicalItem)
                _buildPhysicalItemInfo(context, asset),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildCostTag(BuildContext context, String label, double value) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Text(
        '$label ¥${value.toStringAsFixed(2)}',
        style: TextStyle(
          fontSize: 14,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
  
  Widget _buildSubscriptionInfo(BuildContext context, Asset asset) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
          const SizedBox(width: 4),
          Text(
            '${asset.billingCycle.label} ¥${(asset.billingAmount ?? 0).toStringAsFixed(2)}',
            style: const TextStyle(color: Colors.grey),
          ),
          if (asset.nextRenewalDate != null)
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                '下次续费: ${_formatDate(asset.nextRenewalDate!)}',
                style: const TextStyle(color: Colors.orange),
              ),
            ),
        ],
      ),
    );
  }
  
  Widget _buildPhysicalItemInfo(BuildContext context, Asset asset) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          const Icon(Icons.timer, size: 16, color: Colors.grey),
          const SizedBox(width: 4),
          Text(
            '已使用 ${asset.usedDays} 天',
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(width: 8),
          Text(
            '日均 ¥${asset.dailyCost.toStringAsFixed(2)}',
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        ],
      ),
    );
  }
  
  Color _getStatusColor(AssetStatus status) {
    switch (status) {
      case AssetStatus.active:
        return Colors.green;
      case AssetStatus.retired:
        return Colors.grey;
      case AssetStatus.sold:
        return Colors.blue;
      case AssetStatus.discarded:
        return Colors.red;
    }
  }
  
  String _formatDate(DateTime date) {
    return '${date.month}/${date.day}';
  }
  
  void _showFilterDialog(BuildContext context) {
    AssetType? selectedType = _filterType;
    AssetStatus? selectedStatus = _filterStatus;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('筛选'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<AssetType>(
                value: selectedType,
                decoration: const InputDecoration(labelText: '资产类型'),
                items: [
                  const DropdownMenuItem(value: null, child: Text('全部')),
                  ...AssetType.values.map((type) => DropdownMenuItem(
                    value: type,
                    child: Text(type.label),
                  )),
                ],
                onChanged: (value) => setState(() => selectedType = value),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<AssetStatus>(
                value: selectedStatus,
                decoration: const InputDecoration(labelText: '状态'),
                items: [
                  const DropdownMenuItem(value: null, child: Text('全部')),
                  ...AssetStatus.values.map((status) => DropdownMenuItem(
                    value: status,
                    child: Text(status.label),
                  )),
                ],
                onChanged: (value) => setState(() => selectedStatus = value),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  selectedType = null;
                  selectedStatus = null;
                });
              },
              child: const Text('清除'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('取消'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                this.setState(() {
                  _filterType = selectedType;
                  _filterStatus = selectedStatus;
                });
              },
              child: const Text('确定'),
            ),
          ],
        ),
      ),
    );
  }
  
  void _navigateToAddAsset(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AssetEditPage(),
      ),
    );
  }
  
  void _navigateToAssetDetail(BuildContext context, Asset asset) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AssetDetailPage(asset: asset),
      ),
    );
  }
}

class AssetEditPage extends ConsumerStatefulWidget {
  final Asset? existing;

  const AssetEditPage({super.key, this.existing});

  @override
  ConsumerState<AssetEditPage> createState() => _AssetEditPageState();
}

class _AssetEditPageState extends ConsumerState<AssetEditPage> {
  late TextEditingController _nameController;
  late TextEditingController _subCategoryController;
  late TextEditingController _priceController;
  late TextEditingController _currentValueController;
  late TextEditingController _billingAmountController;
  late TextEditingController _noteController;
  late TextEditingController _tagsController;
  late AssetType _type;
  late AssetStatus _status;
  late BillingCycle _billingCycle;
  late DateTime _startDate;
  DateTime? _endDate;
  DateTime? _nextRenewalDate;
  DateTime? _trialEndDate;
  bool _autoRenew = false;

  @override
  void initState() {
    super.initState();
    _type = widget.existing?.type ?? AssetType.physicalItem;
    _status = widget.existing?.status ?? AssetStatus.active;
    _billingCycle = widget.existing?.billingCycle ?? BillingCycle.oneTime;
    _startDate = widget.existing?.startDate ?? DateTime.now();
    _endDate = widget.existing?.endDate;
    _nextRenewalDate = widget.existing?.nextRenewalDate;
    _trialEndDate = widget.existing?.trialEndDate;
    _autoRenew = widget.existing?.autoRenew ?? false;

    _nameController = TextEditingController(text: widget.existing?.name ?? '');
    _subCategoryController = TextEditingController(text: widget.existing?.subCategory ?? '');
    _priceController = TextEditingController(
      text: widget.existing?.purchasePrice.toString() ?? '',
    );
    _currentValueController = TextEditingController(
      text: widget.existing?.currentValue?.toString() ?? '',
    );
    _billingAmountController = TextEditingController(
      text: widget.existing?.billingAmount?.toString() ?? '',
    );
    _noteController = TextEditingController(text: widget.existing?.note ?? '');
    _tagsController = TextEditingController(
      text: widget.existing?.tags.join(',') ?? '',
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _subCategoryController.dispose();
    _priceController.dispose();
    _currentValueController.dispose();
    _billingAmountController.dispose();
    _noteController.dispose();
    _tagsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.existing == null ? '添加资产' : '编辑资产'),
        actions: [
          if (widget.existing != null)
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: _delete,
            ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: '资产名称 *'),
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<AssetType>(
            value: _type,
            decoration: const InputDecoration(labelText: '资产类型'),
            items: AssetType.values.map((type) => DropdownMenuItem(
              value: type,
              child: Text(type.label),
            )).toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() => _type = value);
              }
            },
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _subCategoryController,
            decoration: const InputDecoration(
              labelText: '自定义分类',
              hintText: '例如：数码、家电、收藏',
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _priceController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              labelText: '购入价格 *',
              prefixText: '¥',
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _currentValueController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              labelText: '当前估值（可选）',
              prefixText: '¥',
            ),
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<AssetStatus>(
            value: _status,
            decoration: const InputDecoration(labelText: '状态'),
            items: AssetStatus.values.map((status) => DropdownMenuItem(
              value: status,
              child: Text(status.label),
            )).toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() => _status = value);
              }
            },
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.calendar_today),
                  label: Text('启用: ${_startDate.toString().split(' ')[0]}'),
                  onPressed: () => _pickDate(true, false),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.event_busy),
                  label: Text(_endDate == null ? '失效日期' : '失效: ${_endDate!.toString().split(' ')[0]}'),
                  onPressed: () => _pickDate(true, true),
                ),
              ),
            ],
          ),
          if (_type == AssetType.subscription) ...[
            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 16),
            Text('订阅信息', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 16),
            DropdownButtonFormField<BillingCycle>(
              value: _billingCycle,
              decoration: const InputDecoration(labelText: '计费周期'),
              items: BillingCycle.values.map((cycle) => DropdownMenuItem(
                value: cycle,
                child: Text(cycle.label),
              )).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() => _billingCycle = value);
                }
              },
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _billingAmountController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: '每期费用',
                prefixText: '¥',
              ),
            ),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              icon: const Icon(Icons.event_repeat),
              label: Text(_nextRenewalDate == null 
                ? '下次续费日期' 
                : '续费: ${_nextRenewalDate!.toString().split(' ')[0]}'),
              onPressed: () => _pickDate(false, false, isRenewal: true),
            ),
            const SizedBox(height: 8),
            SwitchListTile(
              title: const Text('自动续费'),
              value: _autoRenew,
              onChanged: (value) => setState(() => _autoRenew = value),
            ),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              icon: const Icon(Icons.timer),
              label: Text(_trialEndDate == null 
                ? '免费试用截止（可选）' 
                : '试用: ${_trialEndDate!.toString().split(' ')[0]}'),
              onPressed: () => _pickDate(false, false, isTrial: true),
            ),
          ],
          const SizedBox(height: 16),
          TextField(
            controller: _noteController,
            maxLines: 4,
            decoration: const InputDecoration(
              labelText: '备注',
              alignLabelWithHint: true,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _tagsController,
            decoration: const InputDecoration(
              labelText: '标签（用逗号分隔）',
              hintText: '例如：数码,收藏,推荐',
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _save,
            child: Text(widget.existing == null ? '保存' : '更新'),
          ),
        ],
      ),
    );
  }

  Future<void> _pickDate(bool isStart, bool isEnd, {bool isRenewal = false, bool isTrial = false}) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
    if (date != null) {
      setState(() {
        if (isStart) {
          _startDate = date;
        } else if (isEnd) {
          _endDate = date;
        } else if (isRenewal) {
          _nextRenewalDate = date;
        } else if (isTrial) {
          _trialEndDate = date;
        }
      });
    }
  }

  Future<void> _save() async {
    if (_nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('请输入资产名称')),
      );
      return;
    }
    final price = double.tryParse(_priceController.text);
    if (price == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('请输入有效的购入价格')),
      );
      return;
    }

    final tags = _tagsController.text
        .split(',')
        .map((t) => t.trim())
        .where((t) => t.isNotEmpty)
        .toList();

    // 订阅类型：自动补全 billingAmount 和 nextRenewalDate
    double? finalBillingAmount = double.tryParse(_billingAmountController.text);
    DateTime? finalNextRenewalDate = _nextRenewalDate;
    if (_type == AssetType.subscription) {
      if (finalBillingAmount == null && price > 0) {
        finalBillingAmount = price;
      }
      if (finalNextRenewalDate == null && _billingCycle != BillingCycle.oneTime) {
        final cycleDays = switch (_billingCycle) {
          BillingCycle.weekly => 7,
          BillingCycle.monthly => 30,
          BillingCycle.yearly => 365,
          BillingCycle.custom => _endDate?.difference(_startDate).inDays ?? 365,
          BillingCycle.oneTime => 0,
        };
        if (cycleDays > 0) {
          finalNextRenewalDate = _startDate.add(Duration(days: cycleDays));
        }
      }
    }

    final asset = Asset(
      id: widget.existing?.id,
      name: _nameController.text.trim(),
      type: _type,
      subCategory: _subCategoryController.text.trim().isEmpty 
        ? null : _subCategoryController.text.trim(),
      purchasePrice: price,
      currentValue: double.tryParse(_currentValueController.text),
      startDate: _startDate,
      endDate: _endDate,
      billingCycle: _billingCycle,
      billingAmount: finalBillingAmount,
      nextRenewalDate: finalNextRenewalDate,
      autoRenew: _autoRenew,
      trialEndDate: _trialEndDate,
      status: _status,
      tags: tags,
      note: _noteController.text.trim().isEmpty ? null : _noteController.text.trim(),
      createdAt: widget.existing?.createdAt,
    );

    final repo = ref.read(assetRepositoryProvider);
    if (widget.existing == null) {
      await repo.insertAsset(asset);
    } else {
      await repo.updateAsset(asset);
    }
    ref.invalidate(assetsProvider);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('已保存')),
      );
      Navigator.pop(context);
    }
  }

  Future<void> _delete() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('确认删除'),
        content: const Text('删除后无法恢复，是否继续？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('删除'),
          ),
        ],
      ),
    );

    if (confirm == true && widget.existing != null) {
      await ref.read(assetRepositoryProvider).deleteAsset(widget.existing!.id);
      ref.invalidate(assetsProvider);
      if (mounted) {
        Navigator.pop(context);
      }
    }
  }
}

class AssetDetailPage extends ConsumerWidget {
  final Asset asset;

  const AssetDetailPage({super.key, required this.asset});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('资产详情'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AssetEditPage(existing: asset),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    asset.name,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: _getStatusColor(asset.status),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          asset.status.label,
                          style: const TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(asset.type.label),
                      if (asset.subCategory != null) ...[
                        const SizedBox(width: 4),
                        Text('· ${asset.subCategory}'),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '价值信息',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  _buildInfoRow('购入价格', '¥${asset.purchasePrice.toStringAsFixed(2)}'),
                  if (asset.currentValue != null)
                    _buildInfoRow('当前估值', '¥${asset.currentValue!.toStringAsFixed(2)}'),
                  if (asset.sellPrice != null)
                    _buildInfoRow('卖出价格', '¥${asset.sellPrice!.toStringAsFixed(2)}'),
                  _buildInfoRow('日均成本', '¥${asset.dailyCost.toStringAsFixed(2)}'),
                  _buildInfoRow('月均成本', '¥${asset.monthlyCost.toStringAsFixed(2)}'),
                  if (asset.profitOrLoss != null)
                    _buildInfoRow('变现盈亏', asset.profitOrLoss! >= 0 
                      ? '+¥${asset.profitOrLoss!.toStringAsFixed(2)}' 
                      : '¥${asset.profitOrLoss!.toStringAsFixed(2)}'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '时间信息',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  _buildInfoRow('启用日期', asset.startDate.toString().split(' ')[0]),
                  if (asset.expiryDate != null)
                    _buildInfoRow(
                      asset.type == AssetType.subscription ? '到期日期' : '失效日期',
                      asset.expiryDate!.toString().split(' ')[0],
                    ),
                  _buildInfoRow('已用时长', '${asset.usedDays} 天'),
                  if (asset.expiryDate != null) _buildRemainingDays(asset.expiryDate!),
                ],
              ),
            ),
          ),
          if (asset.type == AssetType.subscription) ...[
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '订阅信息',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 16),
                    _buildInfoRow('计费周期', asset.billingCycle.label),
                    _buildInfoRow('每期费用', '¥${(asset.billingAmount ?? 0).toStringAsFixed(2)}'),
                    if (asset.nextRenewalDate != null)
                      _buildInfoRow('下次续费', asset.nextRenewalDate!.toString().split(' ')[0]),
                    _buildInfoRow('自动续费', asset.autoRenew ? '是' : '否'),
                    if (asset.trialEndDate != null)
                      _buildInfoRow('免费试用截止', asset.trialEndDate!.toString().split(' ')[0]),
                  ],
                ),
              ),
            ),
          ],
          if (asset.note != null) ...[
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '备注',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(asset.note!),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
  
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildRemainingDays(DateTime expiry) {
    final remaining = expiry.difference(DateTime.now()).inDays;
    String text;
    Color color;
    if (remaining < 0) {
      text = '已过期 ${-remaining} 天';
      color = Colors.red;
    } else if (remaining == 0) {
      text = '今天到期';
      color = Colors.orange;
    } else if (remaining <= 7) {
      text = '还剩 $remaining 天';
      color = Colors.orange;
    } else {
      text = '还剩 $remaining 天';
      color = Colors.grey;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('剩余时间', style: TextStyle(color: Colors.grey)),
          Text(text, style: TextStyle(fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }
  
  Color _getStatusColor(AssetStatus status) {
    switch (status) {
      case AssetStatus.active:
        return Colors.green;
      case AssetStatus.retired:
        return Colors.grey;
      case AssetStatus.sold:
        return Colors.blue;
      case AssetStatus.discarded:
        return Colors.red;
    }
  }
}