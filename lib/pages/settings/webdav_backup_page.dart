/// WebDAV 备份管理页面
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/webdav_service.dart';
import '../../services/export_import_service.dart';

class WebDavBackupPage extends ConsumerStatefulWidget {
  const WebDavBackupPage({super.key});

  @override
  ConsumerState<WebDavBackupPage> createState() => _WebDavBackupPageState();
}

class _WebDavBackupPageState extends ConsumerState<WebDavBackupPage> {
  WebDavConfig? _config;
  bool _loading = true;
  bool _configured = false;

  final _serverController = TextEditingController();
  final _userController = TextEditingController();
  final _passController = TextEditingController();
  final _pathController = TextEditingController(text: '/life_record_backups');

  @override
  void initState() {
    super.initState();
    _loadConfig();
  }

  Future<void> _loadConfig() async {
    final service = ref.read(webdavServiceProvider);
    final cfg = await service.loadConfig();
    if (mounted) {
      setState(() {
        _config = cfg;
        _loading = false;
        _configured = cfg != null && cfg.isValid;
        if (cfg != null) {
          _serverController.text = cfg.serverUrl;
          _userController.text = cfg.username;
          _passController.text = cfg.password;
          _pathController.text = cfg.remotePath;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('WebDAV 备份')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildConfigCard(context),
                const SizedBox(height: 16),
                if (_configured) _buildActionsCard(context),
                const SizedBox(height: 16),
                if (_configured) _buildBackupListCard(context),
              ],
            ),
    );
  }

  Widget _buildConfigCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.cloud, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 8),
                Text('WebDAV 配置', style: Theme.of(context).textTheme.titleMedium),
                const Spacer(),
                if (_configured)
                  const Chip(
                    label: Text('已配置', style: TextStyle(color: Colors.green)),
                    backgroundColor: Colors.transparent,
                    side: BorderSide(color: Colors.green),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            const Text('支持坚果云、Nextcloud、群晖等 WebDAV 服务',
                style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 16),
            TextField(
              controller: _serverController,
              decoration: const InputDecoration(
                labelText: '服务器地址',
                hintText: '例如：https://dav.jianguoyun.com/dav/',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _userController,
              decoration: const InputDecoration(
                labelText: '用户名',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _passController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: '密码 / 应用密码',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _pathController,
              decoration: const InputDecoration(
                labelText: '远程目录',
                hintText: '/life_record_backups',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.wifi_protected_setup),
                    label: const Text('测试连接'),
                    onPressed: _testConnection,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton.icon(
                    icon: const Icon(Icons.save),
                    label: const Text('保存配置'),
                    onPressed: _saveConfig,
                  ),
                ),
              ],
            ),
            if (_configured) ...[
              const SizedBox(height: 12),
              TextButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('清除配置'),
                      content: const Text('确定要清除 WebDAV 配置吗？不会删除云端备份文件。'),
                      actions: [
                        TextButton(onPressed: () => Navigator.pop(context), child: const Text('取消')),
                        TextButton(
                          onPressed: () async {
                            await ref.read(webdavServiceProvider).clearConfig();
                            if (mounted) {
                              Navigator.pop(context);
                              _serverController.clear();
                              _userController.clear();
                              _passController.clear();
                              _pathController.text = '/life_record_backups';
                              setState(() {
                                _config = null;
                                _configured = false;
                              });
                            }
                          },
                          style: TextButton.styleFrom(foregroundColor: Colors.red),
                          child: const Text('清除'),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.delete_sweep, color: Colors.red),
                label: const Text('清除配置', style: TextStyle(color: Colors.red)),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildActionsCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.backup, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 8),
                Text('备份操作', style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                icon: const Icon(Icons.upload),
                label: const Text('立即备份到云端'),
                onPressed: _doBackup,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                icon: const Icon(Icons.refresh),
                label: const Text('刷新备份列表'),
                onPressed: () => setState(() {}),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackupListCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.list_alt, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 8),
                Text('云端备份列表', style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
            const SizedBox(height: 16),
            FutureBuilder<List<BackupFile>>(
              key: UniqueKey(),
              future: ref.read(webdavServiceProvider).listBackups(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: Padding(
                    padding: EdgeInsets.all(24),
                    child: CircularProgressIndicator(),
                  ));
                }
                if (snapshot.hasError) {
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    color: Colors.red.shade50,
                    child: Text('加载失败: ${snapshot.error}',
                        style: const TextStyle(color: Colors.red)),
                  );
                }
                final list = snapshot.data ?? [];
                if (list.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Icon(Icons.folder_open, size: 48, color: Colors.grey),
                        SizedBox(height: 8),
                        Text('暂无备份文件', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  );
                }
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: list.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final item = list[index];
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.insert_drive_file, color: Colors.blue),
                      title: Text(item.name.replaceAll('life_record_', '').replaceAll('.json', '')),
                      subtitle: Text(
                        '${_formatDate(item.modified)} · ${_formatSize(item.size)}',
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            tooltip: '恢复此备份',
                            icon: const Icon(Icons.download, color: Colors.blue),
                            onPressed: () => _doRestore(item),
                          ),
                          IconButton(
                            tooltip: '删除',
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _doDelete(item),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // ========== 操作方法 ==========

  Future<void> _saveConfig() async {
    final url = _serverController.text.trim();
    final user = _userController.text.trim();
    final pass = _passController.text;
    final path = _pathController.text.trim().isEmpty
        ? '/life_record_backups'
        : _pathController.text.trim();

    if (url.isEmpty || user.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('请填写服务器地址和用户名')),
      );
      return;
    }

    final cfg = WebDavConfig(
      serverUrl: url,
      username: user,
      password: pass,
      remotePath: path.startsWith('/') ? path : '/$path',
    );

    try {
      await ref.read(webdavServiceProvider).saveConfig(cfg);
      setState(() {
        _config = cfg;
        _configured = true;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('配置已保存')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('保存失败: $e')),
        );
      }
    }
  }

  Future<void> _testConnection() async {
    final url = _serverController.text.trim();
    final user = _userController.text.trim();
    final pass = _passController.text;
    final path = _pathController.text.trim().isEmpty
        ? '/life_record_backups'
        : _pathController.text.trim();

    if (url.isEmpty || user.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('请先填写服务器和用户名')),
      );
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const AlertDialog(
        content: Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 16),
            Text('正在测试连接...'),
          ],
        ),
      ),
    );

    final cfg = WebDavConfig(
      serverUrl: url,
      username: user,
      password: pass,
      remotePath: path.startsWith('/') ? path : '/$path',
    );

    final ok = await ref.read(webdavServiceProvider).testConnection(cfg);
    if (mounted) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(ok ? '连接成功' : '连接失败，请检查配置'),
          backgroundColor: ok ? Colors.green : Colors.red,
        ),
      );
    }
  }

  Future<void> _doBackup() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const AlertDialog(
        content: Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 16),
            Text('正在备份到云端...'),
          ],
        ),
      ),
    );

    try {
      final name = await ref.read(webdavServiceProvider).backupNow();
      if (mounted) {
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('备份成功'),
            content: Text('已上传备份: $name'),
            actions: [
              FilledButton(
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {});
                },
                child: const Text('好的'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('备份失败: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  Future<void> _doRestore(BackupFile item) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('恢复备份'),
        content: Text('将从以下备份恢复数据：\n\n${item.name}\n\n${_formatDate(item.modified)}\n\n已存在的记录（按ID判断）不会重复导入。'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('取消')),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            style: FilledButton.styleFrom(backgroundColor: Colors.blue),
            child: const Text('开始恢复'),
          ),
        ],
      ),
    );
    if (confirm != true) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const AlertDialog(
        content: Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 16),
            Text('正在恢复备份...'),
          ],
        ),
      ),
    );

    try {
      final result = await ref.read(webdavServiceProvider).restoreBackup(item.path);
      if (mounted) {
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(result.success ? '恢复完成' : '恢复失败'),
            content: Text(result.summary),
            actions: [
              FilledButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('好的'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('恢复失败: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  Future<void> _doDelete(BackupFile item) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('删除备份'),
        content: Text('确定要删除以下云端备份吗？\n\n${item.name}'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('取消')),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('删除'),
          ),
        ],
      ),
    );
    if (confirm != true) return;

    try {
      await ref.read(webdavServiceProvider).deleteBackup(item.path);
      if (mounted) {
        setState(() {});
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('已删除')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('删除失败: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  String _formatDate(DateTime dt) {
    return '${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')} '
        '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
  }

  String _formatSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / 1024 / 1024).toStringAsFixed(2)} MB';
  }
}
