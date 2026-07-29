/// 分类管理页面
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' show Value;

import '../../database/app_database.dart';
import '../../providers/custom_providers.dart';

class CategoryManagePage extends ConsumerStatefulWidget {
  final String entityType;

  const CategoryManagePage({super.key, required this.entityType});

  @override
  ConsumerState<CategoryManagePage> createState() => _CategoryManagePageState();
}

class _CategoryManagePageState extends ConsumerState<CategoryManagePage> {
  late final FutureProvider<List<CustomCategory>> _categoriesProvider;

  @override
  void initState() {
    super.initState();
    _categoriesProvider = FutureProvider<List<CustomCategory>>((ref) async {
      final repo = ref.watch(customCategoryRepositoryProvider);
      return repo.getCategoriesByType(widget.entityType);
    });
  }

  @override
  Widget build(BuildContext context) {
    final categoriesAsync = ref.watch(_categoriesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(_getTitle()),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showAddDialog(context, ref),
          ),
        ],
      ),
      body: categoriesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('加载失败: $e')),
        data: (categories) => categories.isEmpty
            ? const Center(child: Text('暂无分类，点击右上角添加'))
            : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: categories.length,
                itemBuilder: (context, index) => _buildCategoryItem(context, ref, categories[index]),
              ),
      ),
    );
  }

  String _getTitle() {
    switch (widget.entityType) {
      case 'asset':
        return '资产管理分类';
      case 'media':
        return '娱乐记录分类';
      default:
        return '分类管理';
    }
  }

  Widget _buildCategoryItem(BuildContext context, WidgetRef ref, CustomCategory category) {
    return Card(
      child: ListTile(
        leading: Icon(_parseIcon(category.icon)),
        title: Text(category.categoryLabel),
        subtitle: Text('键值: ${category.categoryKey}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, size: 20),
              onPressed: () => _showEditDialog(context, ref, category),
            ),
            IconButton(
              icon: const Icon(Icons.delete, size: 20),
              onPressed: () => _deleteCategory(context, ref, category),
            ),
          ],
        ),
      ),
    );
  }

  IconData _parseIcon(String? iconStr) {
    if (iconStr == null) return Icons.category;
    final iconMap = {
      'book': Icons.book,
      'movie': Icons.movie,
      'game': Icons.gamepad,
      'music': Icons.music_note,
      'food': Icons.restaurant,
      'travel': Icons.flight,
      'shopping': Icons.shopping_bag,
      'work': Icons.work,
      'home': Icons.home,
      'car': Icons.directions_car,
      'device': Icons.devices,
      'subscription': Icons.subscriptions,
      'other': Icons.more_horiz,
    };
    return iconMap[iconStr] ?? Icons.category;
  }

  void _showAddDialog(BuildContext context, WidgetRef ref) {
    final keyController = TextEditingController();
    final labelController = TextEditingController();
    String selectedIcon = 'other';

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('新建分类'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: keyController,
                  decoration: const InputDecoration(
                    labelText: '分类键值（英文）',
                    hintText: '例如：game, movie, book',
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: labelController,
                  decoration: const InputDecoration(
                    labelText: '分类名称',
                    hintText: '例如：游戏, 电影, 书籍',
                  ),
                ),
                const SizedBox(height: 16),
                const Text('选择图标'),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    {'book': Icons.book},
                    {'movie': Icons.movie},
                    {'game': Icons.gamepad},
                    {'music': Icons.music_note},
                    {'food': Icons.restaurant},
                    {'travel': Icons.flight},
                    {'shopping': Icons.shopping_bag},
                    {'work': Icons.work},
                    {'home': Icons.home},
                    {'car': Icons.directions_car},
                    {'device': Icons.devices},
                    {'subscription': Icons.subscriptions},
                    {'other': Icons.more_horiz},
                  ].map((item) {
                    final key = item.keys.first;
                    final icon = item.values.first;
                    return ChoiceChip(
                      label: Icon(icon, size: 20),
                      selected: selectedIcon == key,
                      onSelected: (selected) {
                        if (selected) setState(() => selectedIcon = key);
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('取消'),
            ),
            TextButton(
              onPressed: () async {
                final key = keyController.text.trim();
                final label = labelController.text.trim();
                if (key.isEmpty || label.isEmpty) return;

                final repo = ref.read(customCategoryRepositoryProvider);
                await repo.insertCategory(CustomCategoriesCompanion(
                  entityType: Value(widget.entityType),
                  categoryKey: Value(key),
                  categoryLabel: Value(label),
                  icon: Value(selectedIcon),
                ));
                ref.invalidate(_categoriesProvider);
                Navigator.pop(context);
              },
              child: const Text('创建'),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context, WidgetRef ref, CustomCategory category) {
    final keyController = TextEditingController(text: category.categoryKey);
    final labelController = TextEditingController(text: category.categoryLabel);
    String selectedIcon = category.icon ?? 'other';

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('编辑分类'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: keyController,
                  decoration: const InputDecoration(labelText: '分类键值'),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: labelController,
                  decoration: const InputDecoration(labelText: '分类名称'),
                ),
                const SizedBox(height: 16),
                const Text('选择图标'),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    {'book': Icons.book},
                    {'movie': Icons.movie},
                    {'game': Icons.gamepad},
                    {'music': Icons.music_note},
                    {'food': Icons.restaurant},
                    {'travel': Icons.flight},
                    {'shopping': Icons.shopping_bag},
                    {'work': Icons.work},
                    {'home': Icons.home},
                    {'car': Icons.directions_car},
                    {'device': Icons.devices},
                    {'subscription': Icons.subscriptions},
                    {'other': Icons.more_horiz},
                  ].map((item) {
                    final key = item.keys.first;
                    final icon = item.values.first;
                    return ChoiceChip(
                      label: Icon(icon, size: 20),
                      selected: selectedIcon == key,
                      onSelected: (selected) {
                        if (selected) setState(() => selectedIcon = key);
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('取消'),
            ),
            TextButton(
              onPressed: () async {
                final repo = ref.read(customCategoryRepositoryProvider);
                await repo.updateCategory(CustomCategory(
                  id: category.id,
                  entityType: widget.entityType,
                  categoryKey: keyController.text.trim(),
                  categoryLabel: labelController.text.trim(),
                  icon: selectedIcon,
                ));
                ref.invalidate(_categoriesProvider);
                Navigator.pop(context);
              },
              child: const Text('保存'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _deleteCategory(BuildContext context, WidgetRef ref, CustomCategory category) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('确认删除'),
        content: Text('确定删除分类 "${category.categoryLabel}" 吗？'),
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

    if (confirm == true) {
      final repo = ref.read(customCategoryRepositoryProvider);
      await repo.deleteCategory(category.id);
      ref.invalidate(_categoriesProvider);
    }
  }
}