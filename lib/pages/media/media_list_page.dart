/// 娱乐记录列表页面
library;

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/media_item.dart';
import '../../providers/media_providers.dart';
import '../../services/api_search_service.dart';

class MediaListPage extends ConsumerStatefulWidget {
  const MediaListPage({super.key});

  @override
  ConsumerState<MediaListPage> createState() => _MediaListPageState();
}

class _MediaListPageState extends ConsumerState<MediaListPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  MediaType _selectedType = MediaType.book;
  final _localSearchController = TextEditingController();
  String _localSearchQuery = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: MediaType.values.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedType = MediaType.values[_tabController.index];
        _localSearchQuery = '';
        _localSearchController.clear();
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _localSearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaItemsAsync = ref.watch(mediaItemsByTypeProvider(_selectedType));

    return Scaffold(
      appBar: AppBar(
        title: const Text('娱乐记录'),
        actions: [
          IconButton(
            icon: const Icon(Icons.casino),
            tooltip: '随机推荐',
            onPressed: () => _showRandomDialog(context),
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.search),
            tooltip: '搜索',
            onSelected: (value) {
              if (value == 'api') {
                _showApiSearchDialog(context, _selectedType);
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'api',
                child: ListTile(
                  leading: Icon(Icons.cloud),
                  title: Text('API 搜索'),
                  subtitle: Text('从 TMDB/IGDB/Open Library 搜索'),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            isScrollable: true,
            tabs: MediaType.values.map((type) => Tab(text: type.label)).toList(),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: _localSearchController,
              decoration: InputDecoration(
                hintText: '搜索本地记录...',
                prefixIcon: const Icon(Icons.search, size: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                isDense: true,
                suffixIcon: _localSearchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear, size: 20),
                        onPressed: () {
                          _localSearchController.clear();
                          setState(() => _localSearchQuery = '');
                        },
                      )
                    : null,
              ),
              onChanged: (value) {
                setState(() => _localSearchQuery = value);
              },
            ),
          ),
          Expanded(
            child: mediaItemsAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('加载失败: $e')),
              data: (items) {
                // 本地搜索过滤
                final filteredItems = _localSearchQuery.isEmpty
                    ? items
                    : items.where((i) =>
                        i.name.toLowerCase().contains(_localSearchQuery.toLowerCase()) ||
                        (i.author?.toLowerCase().contains(_localSearchQuery.toLowerCase()) ?? false) ||
                        i.tags.any((t) => t.toLowerCase().contains(_localSearchQuery.toLowerCase())) ||
                        (i.note?.toLowerCase().contains(_localSearchQuery.toLowerCase()) ?? false) ||
                        i.platforms.any((p) => p.toLowerCase().contains(_localSearchQuery.toLowerCase()))
                      ).toList();
                return _buildMediaList(context, filteredItems);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToAddMedia(context, _selectedType),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildMediaList(BuildContext context, List<MediaItem> items) {
    if (items.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _getTypeIcon(_selectedType),
              size: 64,
              color: Colors.grey,
            ),
            const SizedBox(height: 16),
            const Text(
              '暂无记录',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            const Text(
              '点击搜索按钮从 API 获取\n或点击右下角手动添加',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: items.length,
      itemBuilder: (context, index) => _buildMediaCard(context, items[index]),
    );
  }

  Widget _buildMediaCard(BuildContext context, MediaItem item) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () => _navigateToMediaDetail(context, item.id),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              _buildCover(context, item),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: Theme.of(context).textTheme.titleMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (item.author != null)
                      Text(
                        item.author!,
                        style: const TextStyle(color: Colors.grey),
                        overflow: TextOverflow.ellipsis,
                      ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: _getStatusColor(item.status),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            item.status.label,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        if (item.rating != null) ...[
                          const SizedBox(width: 8),
                          Row(
                            children: List.generate(5, (i) => Icon(
                              Icons.star,
                              size: 14,
                              color: i < item.rating! ? Colors.yellow : Colors.grey,
                            )),
                          ),
                        ],
                      ],
                    ),
                    if (item.platforms.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Wrap(
                          spacing: 4,
                          children: item.platforms.map((platform) => Chip(
                            label: Text(platform),
                            labelStyle: const TextStyle(fontSize: 12),
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          )).toList(),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCover(BuildContext context, MediaItem item) {
    if (item.localCoverPath != null && !kIsWeb) {
      // Web 不支持 Image.file
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          item.localCoverPath!,
          width: 60,
          height: 80,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => _buildPlaceholderIcon(context, item.type),
        ),
      );
    }
    if (item.coverUrl != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          item.coverUrl!,
          width: 60,
          height: 80,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => _buildPlaceholderIcon(context, item.type),
        ),
      );
    }
    return _buildPlaceholderIcon(context, item.type);
  }

  Widget _buildPlaceholderIcon(BuildContext context, MediaType type) {
    return Container(
      width: 60,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(_getTypeIcon(type), size: 32, color: Colors.grey),
    );
  }

  IconData _getTypeIcon(MediaType type) {
    switch (type) {
      case MediaType.book:
        return Icons.book;
      case MediaType.novel:
        return Icons.menu_book;
      case MediaType.movie:
        return Icons.movie;
      case MediaType.tv:
        return Icons.tv;
      case MediaType.anime:
        return Icons.video_library;
      case MediaType.manga:
        return Icons.picture_as_pdf;
      case MediaType.game:
        return Icons.gamepad;
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

  void _showApiSearchDialog(BuildContext context, MediaType type) {
    final searchController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('搜索${type.label}'),
        content: TextField(
          controller: searchController,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: '输入名称搜索',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () async {
              final query = searchController.text.trim();
              if (query.isEmpty) return;
              Navigator.pop(context);
              await _performApiSearch(type, query);
            },
            child: const Text('搜索'),
          ),
        ],
      ),
    );
  }

  Future<void> _performApiSearch(MediaType type, String query) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const AlertDialog(
        content: Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 16),
            Text('搜索中...'),
          ],
        ),
      ),
    );

    final api = ref.read(apiSearchServiceProvider);
    final results = await api.search(type, query);
    
    if (!mounted) return;
    Navigator.pop(context); // 关闭loading

    if (results.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('未找到结果，可手动添加')),
      );
      return;
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.3,
        maxChildSize: 0.9,
        expand: false,
        builder: (context, scrollController) => _buildSearchResults(type, results, scrollController),
      ),
    );
  }

  Widget _buildSearchResults(MediaType type, List<ApiSearchResult> results, ScrollController controller) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '搜索结果 (${results.length})',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              controller: controller,
              itemCount: results.length,
              itemBuilder: (context, index) {
                final result = results[index];
                return Card(
                  child: ListTile(
                    leading: result.coverUrl != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.network(
                              result.coverUrl!,
                              width: 40,
                              height: 60,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.image),
                            ),
                          )
                        : const Icon(Icons.image),
                    title: Text(result.name, maxLines: 2, overflow: TextOverflow.ellipsis),
                    subtitle: Text(
                      [
                        if (result.author != null) result.author!,
                        if (result.releaseDate != null) '${result.releaseDate!.year}',
                        if (result.rating != null) '★${result.rating}',
                      ].join(' · '),
                    ),
                    onTap: () async {
                      final source = result.coverUrl != null && result.coverUrl!.contains('tmdb')
                          ? MediaSource.tmdb
                          : result.coverUrl != null && result.coverUrl!.contains('openlibrary')
                              ? MediaSource.openLibrary
                              : MediaSource.igdb;
                      final item = result.toMediaItem(type, source);
                      await ref.read(mediaRepositoryProvider).insertMediaItem(item);
                      ref.invalidate(mediaItemsByTypeProvider(type));
                      if (context.mounted) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('已添加：${item.name}')),
                        );
                      }
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showRandomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('随机推荐'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('选择要随机的类型：'),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: MediaType.values.map((type) => ActionChip(
                label: Text(type.label),
                onPressed: () async {
                  Navigator.pop(context);
                  await _randomPick(type);
                },
              )).toList(),
            ),
            const SizedBox(height: 16),
            ActionChip(
              label: const Text('全部类型'),
              onPressed: () async {
                Navigator.pop(context);
                await _randomPick(null);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _randomPick(MediaType? type) async {
    final randomItem = await ref.read(mediaRepositoryProvider).getRandomMediaItem(type, null);
    
    if (randomItem == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('没有找到可随机的记录')),
        );
      }
      return;
    }

    if (mounted) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('🎲 随机推荐'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 8),
                randomItem.coverUrl != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          randomItem.coverUrl!,
                          width: 120,
                          height: 160,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                            _buildPlaceholderIcon(context, randomItem.type),
                        ),
                      )
                    : _buildPlaceholderIcon(context, randomItem.type),
                const SizedBox(height: 16),
                Text(
                  randomItem.name,
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                if (randomItem.author != null)
                  Text(randomItem.author!, textAlign: TextAlign.center),
                const SizedBox(height: 16),
                Text('类型: ${randomItem.type.label}'),
                Text('状态: ${randomItem.status.label}'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('再选一个'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _navigateToMediaDetail(context, randomItem.id);
              },
              child: const Text('查看详情'),
            ),
          ],
        ),
      );
    }
  }

  void _navigateToAddMedia(BuildContext context, MediaType type) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MediaEditPage(type: type),
      ),
    );
  }

  void _navigateToMediaDetail(BuildContext context, String id) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MediaDetailPage(id: id),
      ),
    );
  }
}

class MediaEditPage extends ConsumerStatefulWidget {
  final MediaType type;
  final MediaItem? existing;

  const MediaEditPage({super.key, required this.type, this.existing});

  @override
  ConsumerState<MediaEditPage> createState() => _MediaEditPageState();
}

class _MediaEditPageState extends ConsumerState<MediaEditPage> {
  late TextEditingController _nameController;
  late TextEditingController _authorController;
  late TextEditingController _noteController;
  late TextEditingController _platformsController;
  late TextEditingController _tagsController;
  late MediaType _type;
  late MediaStatus _status;
  int? _rating;
  DateTime? _startDate;
  DateTime? _finishDate;

  @override
  void initState() {
    super.initState();
    _type = widget.type;
    _status = widget.existing?.status ?? MediaStatus.wantToRead;
    _nameController = TextEditingController(text: widget.existing?.name ?? '');
    _authorController = TextEditingController(text: widget.existing?.author ?? '');
    _noteController = TextEditingController(text: widget.existing?.note ?? '');
    _platformsController = TextEditingController(
      text: widget.existing?.platforms.join(',') ?? '',
    );
    _tagsController = TextEditingController(
      text: widget.existing?.tags.join(',') ?? '',
    );
    _rating = widget.existing?.rating;
    _startDate = widget.existing?.startDate;
    _finishDate = widget.existing?.finishDate;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _authorController.dispose();
    _noteController.dispose();
    _platformsController.dispose();
    _tagsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.existing == null ? '添加${_type.label}' : '编辑${_type.label}'),
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
            decoration: const InputDecoration(
              labelText: '作品名称 *',
            ),
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<MediaType>(
            value: _type,
            decoration: const InputDecoration(labelText: '类型'),
            items: MediaType.values.map((type) => DropdownMenuItem(
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
          DropdownButtonFormField<MediaStatus>(
            value: _status,
            decoration: const InputDecoration(labelText: '状态'),
            items: MediaStatus.values.map((status) => DropdownMenuItem(
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
          TextField(
            controller: _authorController,
            decoration: const InputDecoration(
              labelText: '作者/导演/制作',
            ),
          ),
          if (_type == MediaType.game) ...[
            const SizedBox(height: 16),
            TextField(
              controller: _platformsController,
              decoration: const InputDecoration(
                labelText: '平台（用逗号分隔）',
                hintText: 'PC, PS5, Switch',
              ),
            ),
          ],
          const SizedBox(height: 16),
          Text('评分'),
          Row(
            children: List.generate(6, (i) => IconButton(
              icon: Icon(
                i < (_rating ?? 0) ? Icons.star : Icons.star_border,
                color: Colors.yellow,
              ),
              onPressed: () {
                setState(() {
                  _rating = i == (_rating ?? 0) ? null : i;
                });
              },
            )),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.calendar_today),
                  label: Text(_startDate == null
                    ? '开始日期'
                    : '开始: ${_startDate!.toString().split(' ')[0]}'),
                  onPressed: () => _pickDate(true),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.event_available),
                  label: Text(_finishDate == null
                    ? '完成日期'
                    : '完成: ${_finishDate!.toString().split(' ')[0]}'),
                  onPressed: () => _pickDate(false),
                ),
              ),
            ],
          ),
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
              hintText: '例如：推荐,已完结,神作',
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

  Future<void> _pickDate(bool isStart) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (date != null) {
      setState(() {
        if (isStart) {
          _startDate = date;
        } else {
          _finishDate = date;
        }
      });
    }
  }

  Future<void> _save() async {
    if (_nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('请输入作品名称')),
      );
      return;
    }

    final platforms = _platformsController.text
        .split(',')
        .map((p) => p.trim())
        .where((p) => p.isNotEmpty)
        .toList();

    final tags = _tagsController.text
        .split(',')
        .map((t) => t.trim())
        .where((t) => t.isNotEmpty)
        .toList();

    final item = MediaItem(
      id: widget.existing?.id,
      name: _nameController.text.trim(),
      type: _type,
      status: _status,
      rating: _rating,
      author: _authorController.text.trim().isEmpty ? null : _authorController.text.trim(),
      platforms: platforms,
      tags: tags,
      note: _noteController.text.trim().isEmpty ? null : _noteController.text.trim(),
      startDate: _startDate,
      finishDate: _finishDate,
      createdAt: widget.existing?.createdAt,
    );

    final repo = ref.read(mediaRepositoryProvider);
    if (widget.existing == null) {
      await repo.insertMediaItem(item);
    } else {
      await repo.updateMediaItem(item);
    }
    ref.invalidate(mediaItemsByTypeProvider(_type));

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
      await ref.read(mediaRepositoryProvider).deleteMediaItem(widget.existing!.id);
      ref.invalidate(mediaItemsByTypeProvider(_type));
      if (mounted) {
        Navigator.pop(context);
      }
    }
  }
}

class MediaDetailPage extends ConsumerWidget {
  final String id;

  const MediaDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaItemAsync = ref.watch(mediaItemByIdProvider(id));

    return Scaffold(
      appBar: AppBar(
        title: const Text('作品详情'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              mediaItemAsync.whenData((item) {
                if (item != null && item.name.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MediaEditPage(type: item.type, existing: item),
                    ),
                  );
                }
              });
            },
          ),
        ],
      ),
      body: mediaItemAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('加载失败: $e')),
        data: (item) => item == null || item.name.isEmpty
          ? const Center(child: Text('记录不存在'))
          : _buildDetail(context, item),
      ),
    );
  }

  Widget _buildDetail(BuildContext context, MediaItem item) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        if (item.coverUrl != null || (item.localCoverPath != null && !kIsWeb))
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: item.localCoverPath != null && !kIsWeb
                  ? Image.network(
                      item.localCoverPath!,
                      width: 200,
                      height: 280,
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      item.coverUrl!,
                      width: 200,
                      height: 280,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                        _buildPlaceholderIcon(context, item.type),
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
                  item.name,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                if (item.author != null)
                  Text(item.author!),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: _getStatusColor(item.status),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        item.status.label,
                        style: const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(item.type.label),
                  ],
                ),
                if (item.rating != null) ...[
                  const SizedBox(height: 8),
                  Row(
                    children: List.generate(5, (i) => Icon(
                      Icons.star,
                      size: 20,
                      color: i < item.rating! ? Colors.yellow : Colors.grey,
                    )),
                  ),
                ],
                if (item.startDate != null || item.finishDate != null) ...[
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      if (item.startDate != null)
                        Text('开始: ${item.startDate!.toString().split(' ')[0]}'),
                      if (item.startDate != null && item.finishDate != null)
                        const Text('  →  '),
                      if (item.finishDate != null)
                        Text('完成: ${item.finishDate!.toString().split(' ')[0]}'),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
        if (item.platforms.isNotEmpty) ...[
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '平台',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: item.platforms.map((platform) => Chip(
                      label: Text(platform),
                    )).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
        if (item.note != null) ...[
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
                  Text(item.note!),
                ],
              ),
            ),
          ),
        ],
        if (item.sourceUrl != null) ...[
          const SizedBox(height: 16),
          Card(
            child: ListTile(
              leading: const Icon(Icons.link),
              title: const Text('外部链接'),
              subtitle: Text(item.sourceUrl!),
              onTap: () {
                // TODO: 打开外部链接
              },
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildPlaceholderIcon(BuildContext context, MediaType type) {
    return Container(
      width: 200,
      height: 280,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Icon(Icons.movie, size: 64, color: Colors.grey),
    );
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