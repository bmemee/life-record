/// 自定义字段管理页面
library;

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' show Value;

import '../../database/app_database.dart';
import '../../providers/custom_providers.dart';

// 字段定义模型
class FieldDefinition {
  final String key;
  final String name;
  final String type;
  final List<String>? options;

  FieldDefinition({
    required this.key,
    required this.name,
    required this.type,
    this.options,
  });

  Map<String, dynamic> toJson() => {
    'key': key,
    'name': name,
    'type': type,
    'options': options,
  };

  factory FieldDefinition.fromJson(Map<String, dynamic> json) => FieldDefinition(
    key: json['key'] ?? '',
    name: json['name'] ?? '',
    type: json['type'] ?? 'text',
    options: json['options'] != null ? List<String>.from(json['options']) : null,
  );
}

class CustomFieldManagePage extends ConsumerStatefulWidget {
  final String entityType;

  const CustomFieldManagePage({super.key, required this.entityType});

  @override
  ConsumerState<CustomFieldManagePage> createState() => _CustomFieldManagePageState();
}

class _CustomFieldManagePageState extends ConsumerState<CustomFieldManagePage> {
  final _fieldDefsProvider = FutureProvider<List<FieldDefinition>>((ref) async {
    final db = ref.watch(databaseProvider);
    final settings = await (db.select(db.appSettings)
      ..where((t) => t.key.equals('${widget.entityType}_field_defs'))).getSingleOrNull();
    if (settings == null || settings.value == null) return [];
    final json = jsonDecode(settings.value!) as List;
    return json.map((e) => FieldDefinition.fromJson(e as Map<String, dynamic>)).toList();
  });

  @override
  Widget build(BuildContext context) {
    final fieldsAsync = ref.watch(_fieldDefsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('${_getTitle()}自定义字段'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showAddDialog(context, ref),
          ),
        ],
      ),
      body: fieldsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('加载失败: $e')),
        data: (fields) => fields.isEmpty
            ? const Center(child: Text('暂无自定义字段，点击右上角添加'))
            : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: fields.length,
                itemBuilder: (context, index) => _buildFieldItem(context, ref, fields[index], index),
              ),
      ),
    );
  }

  String _getTitle() {
    switch (widget.entityType) {
      case 'asset':
        return '资产';
      case 'media':
        return '娱乐';
      default:
        return '';
    }
  }

  Widget _buildFieldItem(BuildContext context, WidgetRef ref, FieldDefinition field, int index) {
    return Card(
      child: ListTile(
        leading: Icon(_getTypeIcon(field.type)),
        title: Text(field.name),
        subtitle: Text('键值: ${field.key} | 类型: ${_getTypeLabel(field.type)}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, size: 20),
              onPressed: () => _showEditDialog(context, ref, field, index),
            ),
            IconButton(
              icon: const Icon(Icons.delete, size: 20),
              onPressed: () => _deleteField(context, ref, index),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getTypeIcon(String type) {
    switch (type) {
      case 'text':
        return Icons.text_fields;
      case 'number':
        return Icons.pin;
      case 'date':
        return Icons.calendar_today;
      case 'select':
        return Icons.arrow_drop_down_circle;
      case 'multiselect':
        return Icons.checklist;
      case 'url':
        return Icons.link;
      default:
        return Icons.text_fields;
    }
  }

  String _getTypeLabel(String type) {
    switch (type) {
      case 'text':
        return '文本';
      case 'number':
        return '数字';
      case 'date':
        return '日期';
      case 'select':
        return '单选';
      case 'multiselect':
        return '多选';
      case 'url':
        return '链接';
      default:
        return '文本';
    }
  }

  void _showAddDialog(BuildContext context, WidgetRef ref) {
    final keyController = TextEditingController();
    final nameController = TextEditingController();
    String selectedType = 'text';
    final optionsController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('新建字段'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: keyController,
                  decoration: const InputDecoration(
                    labelText: '字段键值（英文）',
                    hintText: '例如：purchase_channel, isbn',
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: '字段名称',
                    hintText: '例如：购买渠道、ISBN',
                  ),
                ),
                const SizedBox(height: 16),
                const Text('字段类型'),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    {'text': '文本'},
                    {'number': '数字'},
                    {'date': '日期'},
                    {'select': '单选'},
                    {'multiselect': '多选'},
                    {'url': '链接'},
                  ].map((item) {
                    final key = item.keys.first;
                    final label = item.values.first;
                    return ChoiceChip(
                      label: Text(label),
                      selected: selectedType == key,
                      onSelected: (selected) {
                        if (selected) setState(() => selectedType = key);
                      },
                    );
                  }).toList(),
                ),
                if (selectedType == 'select' || selectedType == 'multiselect') ...[
                  const SizedBox(height: 16),
                  TextField(
                    controller: optionsController,
                    decoration: const InputDecoration(
                      labelText: '选项（用逗号分隔）',
                      hintText: '例如：京东,淘宝,拼多多',
                    ),
                  ),
                ],
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
                final name = nameController.text.trim();
                if (key.isEmpty || name.isEmpty) return;

                final field = FieldDefinition(
                  key: key,
                  name: name,
                  type: selectedType,
                  options: (selectedType == 'select' || selectedType == 'multiselect')
                      ? optionsController.text.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toList()
                      : null,
                );

                final fields = await ref.read(_fieldDefsProvider.future);
                fields.add(field);
                await _saveFieldDefs(ref, fields);
                ref.invalidate(_fieldDefsProvider);
                Navigator.pop(context);
              },
              child: const Text('创建'),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context, WidgetRef ref, FieldDefinition field, int index) {
    final keyController = TextEditingController(text: field.key);
    final nameController = TextEditingController(text: field.name);
    String selectedType = field.type;
    final optionsController = TextEditingController(
      text: field.options?.join(',') ?? '',
    );

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('编辑字段'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: keyController,
                  decoration: const InputDecoration(labelText: '字段键值'),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: '字段名称'),
                ),
                const SizedBox(height: 16),
                const Text('字段类型'),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    {'text': '文本'},
                    {'number': '数字'},
                    {'date': '日期'},
                    {'select': '单选'},
                    {'multiselect': '多选'},
                    {'url': '链接'},
                  ].map((item) {
                    final key = item.keys.first;
                    final label = item.values.first;
                    return ChoiceChip(
                      label: Text(label),
                      selected: selectedType == key,
                      onSelected: (selected) {
                        if (selected) setState(() => selectedType = key);
                      },
                    );
                  }).toList(),
                ),
                if (selectedType == 'select' || selectedType == 'multiselect') ...[
                  const SizedBox(height: 16),
                  TextField(
                    controller: optionsController,
                    decoration: const InputDecoration(
                      labelText: '选项（用逗号分隔）',
                    ),
                  ),
                ],
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
                final fields = await ref.read(_fieldDefsProvider.future);
                fields[index] = FieldDefinition(
                  key: keyController.text.trim(),
                  name: nameController.text.trim(),
                  type: selectedType,
                  options: (selectedType == 'select' || selectedType == 'multiselect')
                      ? optionsController.text.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toList()
                      : null,
                );
                await _saveFieldDefs(ref, fields);
                ref.invalidate(_fieldDefsProvider);
                Navigator.pop(context);
              },
              child: const Text('保存'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _deleteField(BuildContext context, WidgetRef ref, int index) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('确认删除'),
        content: const Text('确定删除该字段定义吗？'),
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
      final fields = await ref.read(_fieldDefsProvider.future);
      fields.removeAt(index);
      await _saveFieldDefs(ref, fields);
      ref.invalidate(_fieldDefsProvider);
    }
  }

  Future<void> _saveFieldDefs(WidgetRef ref, List<FieldDefinition> fields) async {
    final db = ref.read(databaseProvider);
    final json = jsonEncode(fields.map((f) => f.toJson()).toList());
    await db.into(db.appSettings).insertOnConflictUpdate(
      AppSettingsCompanion(
        key: Value('${widget.entityType}_field_defs'),
        value: Value(json),
      ),
    );
  }
}