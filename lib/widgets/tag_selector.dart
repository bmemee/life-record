/// 标签选择组件
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' show Value;

import '../database/app_database.dart';
import '../providers/custom_providers.dart';

class TagSelector extends ConsumerWidget {
  final String entityType;
  final String entityId;
  final List<String> selectedTagIds;
  final Function(List<String>) onTagsChanged;

  const TagSelector({
    super.key,
    required this.entityType,
    required this.entityId,
    required this.selectedTagIds,
    required this.onTagsChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tagsAsync = ref.watch(allTagsProvider);

    return tagsAsync.when(
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
      data: (tags) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '标签',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              TextButton.icon(
                icon: const Icon(Icons.add, size: 18),
                label: const Text('新建'),
                onPressed: () => _showAddTagDialog(context, ref),
              ),
            ],
          ),
          const SizedBox(height: 8),
          if (tags.isEmpty)
            Text(
              '暂无标签，点击新建添加',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            )
          else
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: tags.map((tag) => FilterChip(
                label: Text(tag.name),
                selected: selectedTagIds.contains(tag.id.toString()),
                selectedColor: _parseColor(tag.color).withValues(alpha: 0.3),
                checkmarkColor: _parseColor(tag.color),
                onSelected: (selected) {
                  final newIds = List<String>.from(selectedTagIds);
                  if (selected) {
                    newIds.add(tag.id.toString());
                  } else {
                    newIds.remove(tag.id.toString());
                  }
                  onTagsChanged(newIds);
                },
              )).toList(),
            ),
        ],
      ),
    );
  }

  Color _parseColor(String colorStr) {
    try {
      return Color(int.parse(colorStr.replaceFirst('#', ''), radix: 16));
    } catch (_) {
      return Colors.blue;
    }
  }

  void _showAddTagDialog(BuildContext context, WidgetRef ref) {
    final nameController = TextEditingController();
    Color selectedColor = Colors.blue;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('新建标签'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: '标签名称',
                  hintText: '例如：已读、想买、推荐',
                ),
              ),
              const SizedBox(height: 16),
              const Text('选择颜色'),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  Colors.blue,
                  Colors.green,
                  Colors.orange,
                  Colors.purple,
                  Colors.red,
                  Colors.teal,
                  Colors.pink,
                  Colors.indigo,
                ].map((color) => InkWell(
                  onTap: () => setState(() => selectedColor = color),
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: selectedColor == color ? Colors.black : Colors.transparent,
                        width: 2,
                      ),
                    ),
                  ),
                )).toList(),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('取消'),
            ),
            TextButton(
              onPressed: () async {
                final name = nameController.text.trim();
                if (name.isEmpty) return;

                final repo = ref.read(tagRepositoryProvider);
                await repo.insertTag(TagsCompanion(
                  name: Value(name),
                  color: Value('#${selectedColor.value.toRadixString(16).padLeft(8, '0').substring(2)}'),
                ));
                ref.invalidate(allTagsProvider);
                Navigator.pop(context);
              },
              child: const Text('创建'),
            ),
          ],
        ),
      ),
    );
  }
}