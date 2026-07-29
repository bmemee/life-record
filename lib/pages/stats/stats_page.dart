/// 统计页面
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../models/asset.dart';
import '../../models/media_item.dart';
import '../../providers/asset_providers.dart';
import '../../providers/media_providers.dart';

class StatsPage extends ConsumerWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetsAsync = ref.watch(assetsProvider);
    final mediaItemsAsync = ref.watch(mediaItemsProvider);
    final totalValueAsync = ref.watch(totalAssetValueProvider);
    final monthlySubscriptionAsync = ref.watch(monthlySubscriptionCostProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('统计'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildAssetOverview(context, totalValueAsync, monthlySubscriptionAsync),
          const SizedBox(height: 16),
          assetsAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => const SizedBox(),
            data: (assets) => _buildAssetDistribution(context, assets),
          ),
          const SizedBox(height: 16),
          mediaItemsAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => const SizedBox(),
            data: (items) => _buildMediaStats(context, items),
          ),
          const SizedBox(height: 16),
          _buildQuickStats(context, assetsAsync, mediaItemsAsync),
        ],
      ),
    );
  }

  Widget _buildAssetOverview(
    BuildContext context,
    AsyncValue<double> totalValue,
    AsyncValue<double> monthlySubscription,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '资产总览',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const Divider(),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '总资产净值',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 4),
                      totalValue.when(
                        loading: () => const CircularProgressIndicator(),
                        error: (e, _) => Text('加载失败'),
                        data: (value) => Text(
                          '¥${value.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '月度订阅支出',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 4),
                      monthlySubscription.when(
                        loading: () => const CircularProgressIndicator(),
                        error: (e, _) => Text('加载失败'),
                        data: (value) => Text(
                          '¥${value.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAssetDistribution(BuildContext context, List<Asset> assets) {
    final typeCounts = <AssetType, int>{};
    final typeValues = <AssetType, double>{};

    for (final asset in assets) {
      if (asset.status == AssetStatus.active) {
        typeCounts[asset.type] = (typeCounts[asset.type] ?? 0) + 1;
        typeValues[asset.type] = (typeValues[asset.type] ?? 0) + (asset.currentValue ?? asset.purchasePrice);
      }
    }

    if (typeValues.isEmpty) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text('暂无资产数据'),
        ),
      );
    }

    final totalValue = typeValues.values.reduce((a, b) => a + b);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '资产分类占比',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: PieChart(
                PieChartData(
                  sections: typeValues.entries.map((entry) => PieChartSectionData(
                    color: _getTypeColor(entry.key),
                    value: entry.value,
                    title: '${((entry.value / totalValue) * 100).toStringAsFixed(0)}%',
                    titleStyle: const TextStyle(fontSize: 12),
                    radius: 80,
                  )).toList(),
                  centerSpaceRadius: 40,
                  sectionsSpace: 2,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: typeValues.entries.map((entry) => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    color: _getTypeColor(entry.key),
                  ),
                  const SizedBox(width: 4),
                  Text('${entry.key.label}: ¥${entry.value.toStringAsFixed(0)}'),
                ],
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMediaStats(BuildContext context, List<MediaItem> items) {
    final typeCounts = <MediaType, int>{};
    final statusCounts = <MediaStatus, int>{};

    for (final item in items) {
      typeCounts[item.type] = (typeCounts[item.type] ?? 0) + 1;
      statusCounts[item.status] = (statusCounts[item.status] ?? 0) + 1;
    }

    if (typeCounts.isEmpty) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text('暂无娱乐数据'),
        ),
      );
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '娱乐记录统计',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 150,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  barGroups: typeCounts.entries.map((entry) => BarChartGroupData(
                    x: entry.key.index,
                    barRods: [
                      BarChartRodData(
                        toY: entry.value.toDouble(),
                        color: _getMediaColor(entry.key),
                        width: 16,
                      ),
                    ],
                  )).toList(),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          final index = value.toInt();
                          if (index >= 0 && index < MediaType.values.length) {
                            return Text(
                              MediaType.values[index].label,
                              style: const TextStyle(fontSize: 10),
                            );
                          }
                          return const Text('');
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '状态分布',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: statusCounts.entries.map((entry) => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    color: _getStatusColor(entry.key),
                  ),
                  const SizedBox(width: 4),
                  Text('${entry.key.label}: ${entry.value}'),
                ],
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickStats(
    BuildContext context,
    AsyncValue<List<Asset>> assets,
    AsyncValue<List<MediaItem>> mediaItems,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '快速统计',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const Divider(),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: _buildStatItem(
                    context,
                    Icons.account_balance_wallet,
                    '资产总数',
                    assets.when(
                      loading: () => '-',
                      error: (e, _) => '-',
                      data: (items) => '${items.length}',
                    ),
                  ),
                ),
                Expanded(
                  child: _buildStatItem(
                    context,
                    Icons.movie,
                    '娱乐记录',
                    mediaItems.when(
                      loading: () => '-',
                      error: (e, _) => '-',
                      data: (items) => '${items.length}',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(BuildContext context, IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, size: 24, color: Theme.of(context).colorScheme.primary),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(color: Colors.grey, fontSize: 12)),
        Text(value, style: Theme.of(context).textTheme.titleMedium),
      ],
    );
  }

  Color _getTypeColor(AssetType type) {
    switch (type) {
      case AssetType.physicalItem:
        return Colors.blue;
      case AssetType.subscription:
        return Colors.green;
      case AssetType.oneTimePurchase:
        return Colors.orange;
      case AssetType.consumable:
        return Colors.purple;
    }
  }

  Color _getMediaColor(MediaType type) {
    switch (type) {
      case MediaType.book:
        return Colors.blue;
      case MediaType.novel:
        return Colors.blueAccent;
      case MediaType.movie:
        return Colors.red;
      case MediaType.tv:
        return Colors.green;
      case MediaType.anime:
        return Colors.purple;
      case MediaType.manga:
        return Colors.pink;
      case MediaType.game:
        return Colors.orange;
    }
  }

  Color _getStatusColor(MediaStatus status) {
    switch (status) {
      case MediaStatus.wantToRead:
        return Colors.blue;
      case MediaStatus.reading:
        return Colors.orange;
      case MediaStatus.completed:
        return Colors.green;
      case MediaStatus.dropped:
        return Colors.red;
      case MediaStatus.pending:
        return Colors.grey;
    }
  }
}