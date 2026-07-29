/// 设置页面
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../theme/app_theme.dart';
import '../../providers/app_providers.dart';
import '../../services/export_import_service.dart';
import '../../services/notification_service.dart';
import '../../services/settings_service.dart';
import 'tag_manage_page.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final primaryColor = ref.watch(primaryColorProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('设置'),
      ),
      body: ListView(
        children: [
          _buildSectionHeader('外观'),
          ListTile(
            leading: const Icon(Icons.palette),
            title: const Text('主题模式'),
            subtitle: Text(_getThemeModeLabel(themeMode)),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _showThemeModeDialog(context, ref),
          ),
          ListTile(
            leading: const Icon(Icons.color_lens),
            title: const Text('主题色'),
            subtitle: Text(_getColorName(primaryColor)),
            trailing: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: _parseColor(primaryColor),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey),
              ),
            ),
            onTap: () => _showColorPickerDialog(context, ref),
          ),
          _buildSectionHeader('数据管理'),
          ListTile(
            leading: const Icon(Icons.upload),
            title: const Text('导出数据'),
            subtitle: const Text('导出为 JSON 文件并分享'),
            onTap: () => _exportData(context, ref),
          ),
          ListTile(
            leading: const Icon(Icons.download),
            title: const Text('导入数据'),
            subtitle: const Text('从 JSON 文件导入'),
            onTap: () => _importData(context, ref),
          ),
          _buildSectionHeader('提醒'),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('检查到期提醒'),
            subtitle: const Text('手动检查即将续费的订阅'),
            onTap: () => _checkReminders(context, ref),
          ),
          ListTile(
            leading: const Icon(Icons.alarm),
            title: const Text('提前提醒天数'),
            subtitle: const Text('3 天前'),
            onTap: () => _showReminderDaysDialog(context, ref),
          ),
          _buildSectionHeader('API 配置'),
          ListTile(
            leading: const Icon(Icons.movie_filter),
            title: const Text('TMDB API Key'),
            subtitle: const Text('用于搜索电影/电视/动漫'),
            onTap: () => _showApiKeyDialog(context, ref, 'TMDB'),
          ),
          ListTile(
            leading: const Icon(Icons.gamepad),
            title: const Text('IGDB 凭证'),
            subtitle: const Text('用于搜索游戏'),
            onTap: () => _showIgdbDialog(context, ref),
          ),
          _buildSectionHeader('自定义'),
          ListTile(
            leading: const Icon(Icons.category),
            title: const Text('资产管理分类'),
            onTap: () => _navigateToCustomPage(context, 'category'),
          ),
          ListTile(
            leading: const Icon(Icons.label),
            title: const Text('娱乐记录标签'),
            onTap: () => _navigateToCustomPage(context, 'tag'),
          ),
          ListTile(
            leading: const Icon(Icons.edit_note),
            title: const Text('自定义字段'),
            onTap: () => _navigateToCustomPage(context, 'field'),
          ),
          ListTile(
            leading: const Icon(Icons.tune),
            title: const Text('自定义状态'),
            onTap: () => _navigateToCustomPage(context, 'status'),
          ),
          _buildSectionHeader('关于'),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('关于应用'),
            subtitle: const Text('版本 1.0.0'),
            onTap: () => _showAboutDialog(context),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    );
  }

  String _getThemeModeLabel(String mode) {
    return AppThemeMode.values.firstWhere(
      (m) => m.name == mode,
      orElse: () => AppThemeMode.system,
    ).label;
  }

  String _getColorName(String colorStr) {
    final color = _parseColor(colorStr);
    for (final entry in _colorNames.entries) {
      if (entry.value.value == color.value) {
        return entry.key;
      }
    }
    return '自定义';
  }

  Color _parseColor(String colorStr) {
    try {
      return Color(int.parse(colorStr.replaceFirst('#', ''), radix: 16));
    } catch (_) {
      return Colors.blue;
    }
  }

  void _showThemeModeDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('选择主题模式'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: AppThemeMode.values.map((mode) => RadioListTile(
            title: Text(mode.label),
            value: mode.name,
            groupValue: ref.read(themeModeProvider),
            onChanged: (value) {
              if (value != null) {
                ref.read(themeModeProvider.notifier).state = value;
                ref.read(settingsServiceProvider).saveThemeMode(value);
                Navigator.pop(context);
              }
            },
          )).toList(),
        ),
      ),
    );
  }

  void _showColorPickerDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('选择主题色'),
        content: Wrap(
          spacing: 12,
          runSpacing: 12,
          children: AppTheme.primaryColors.map((color) {
            final hex = '#${color.value.toRadixString(16).padLeft(8, '0').substring(2)}';
            return InkWell(
              onTap: () {
                ref.read(primaryColorProvider.notifier).state = hex;
                ref.read(settingsServiceProvider).savePrimaryColor(hex);
                Navigator.pop(context);
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ref.read(primaryColorProvider) == hex
                        ? Colors.black
                        : Colors.transparent,
                    width: 2,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Future<void> _exportData(BuildContext context, WidgetRef ref) async {
    final service = ref.read(exportImportServiceProvider);
    try {
      await service.shareExport();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('数据导出成功')),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('导出失败: $e')),
        );
      }
    }
  }

  Future<void> _importData(BuildContext context, WidgetRef ref) async {
    final service = ref.read(exportImportServiceProvider);
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('导入数据'),
        content: const Text('将导入新数据，已存在的记录不会重复导入。是否继续？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('确定'),
          ),
        ],
      ),
    );
    
    if (confirm != true) return;
    
    try {
      final result = await service.importFromJson();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(result.summary)),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('导入失败: $e')),
        );
      }
    }
  }

  Future<void> _checkReminders(BuildContext context, WidgetRef ref) async {
    final service = ref.read(notificationServiceProvider);
    try {
      final count = await service.checkUpcomingRenewals(ref);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('已发送 $count 条提醒')),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('检查失败: $e')),
        );
      }
    }
  }

  void _showReminderDaysDialog(BuildContext context, WidgetRef ref) async {
    final settings = ref.read(settingsServiceProvider);
    final currentDays = await settings.getReminderDays();

    if (!context.mounted) return;

    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('提前提醒天数'),
        children: [1, 3, 7, 14, 30].map((days) => SimpleDialogOption(
          onPressed: () async {
            await settings.setReminderDays(days);
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('已设置提前 $days 天提醒')),
            );
          },
          child: Row(
            children: [
              if (days == currentDays)
                const Icon(Icons.check, size: 20)
              else
                const SizedBox(width: 20),
              const SizedBox(width: 8),
              Text('$days 天'),
            ],
          ),
        )).toList(),
      ),
    );
  }

  void _showApiKeyDialog(BuildContext context, WidgetRef ref, String apiName) async {
    final settings = ref.read(settingsServiceProvider);
    final controller = TextEditingController();
    
    // 加载已保存的 key
    if (apiName == 'TMDB') {
      controller.text = await settings.getTmdbApiKey() ?? '';
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('$apiName API Key'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: '请输入 API Key',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () async {
              final value = controller.text.trim();
              if (apiName == 'TMDB') {
                await settings.setTmdbApiKey(value);
              }
              Navigator.pop(context);
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('已保存')),
                );
              }
            },
            child: const Text('保存'),
          ),
        ],
      ),
    );
  }

  void _showIgdbDialog(BuildContext context, WidgetRef ref) async {
    final settings = ref.read(settingsServiceProvider);
    final clientIdController = TextEditingController();
    final clientSecretController = TextEditingController();
    
    // 加载已保存的凭证
    clientIdController.text = await settings.getIgdbClientId() ?? '';
    clientSecretController.text = await settings.getIgdbClientSecret() ?? '';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('IGDB 凭证'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: clientIdController,
              decoration: const InputDecoration(
                labelText: 'Client ID',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: clientSecretController,
              decoration: const InputDecoration(
                labelText: 'Client Secret',
              ),
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
              await settings.setIgdbClientId(clientIdController.text.trim());
              await settings.setIgdbClientSecret(clientSecretController.text.trim());
              Navigator.pop(context);
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('已保存')),
                );
              }
            },
            child: const Text('保存'),
          ),
        ],
      ),
    );
  }

  void _navigateToCustomPage(BuildContext context, String type) {
    final titles = {
      'category': '分类管理',
      'tag': '标签管理',
      'field': '自定义字段',
      'status': '自定义状态',
    };

    if (type == 'tag') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TagManagePage()),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(titles[type] ?? '管理'),
        content: const Text('管理功能开发中...\n\n可在此添加/编辑自定义的分类、标签、字段和状态。'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('确定'),
          ),
        ],
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('关于生活记录'),
        content: const SingleChildScrollView(
          child: Text(
            '生活记录是一款帮助您追踪资产价值和娱乐消费的应用。\n\n'
            '功能特色：\n'
            '- 资产记录：物品、订阅、买断、消耗品\n'
            '- 娱乐记录：书籍、小说、电影、电视、动漫、漫画、游戏\n'
            '- 随机推荐：不知道看什么时随机选一个\n'
            '- 主题切换：亮色、暗色、跟随系统\n'
            '- 数据统计：资产分布、娱乐统计\n'
            '- 数据导出导入：JSON 格式\n'
            '- 智能提醒：续费、试用到期\n'
            '- API 搜索：TMDB、IGDB、Open Library',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('确定'),
          ),
        ],
      ),
    );
  }

  static const _colorNames = {
    '蓝色': Colors.blue,
    '青色': Colors.teal,
    '绿色': Colors.green,
    '橙色': Colors.orange,
    '紫色': Colors.purple,
    '粉色': Colors.pink,
    '红色': Colors.red,
    '靛蓝': Colors.indigo,
  };
}