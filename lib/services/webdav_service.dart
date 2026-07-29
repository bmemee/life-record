/// WebDAV 备份服务
library;

import 'dart:convert';
import 'dart:io' show HttpDate;
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/app_providers.dart';
import '../providers/asset_providers.dart';
import '../providers/media_providers.dart';
import '../database/app_database.dart';
import 'export_import_service.dart';
import 'package:drift/drift.dart' show Value;

/// WebDAV 配置
class WebDavConfig {
  final String serverUrl;
  final String username;
  final String password;
  final String remotePath;

  WebDavConfig({
    required this.serverUrl,
    required this.username,
    required this.password,
    this.remotePath = '/life_record_backups',
  });

  Map<String, dynamic> toJson() => {
    'serverUrl': serverUrl,
    'username': username,
    'password': password,
    'remotePath': remotePath,
  };

  factory WebDavConfig.fromJson(Map<String, dynamic> json) => WebDavConfig(
    serverUrl: json['serverUrl'] ?? '',
    username: json['username'] ?? '',
    password: json['password'] ?? '',
    remotePath: json['remotePath'] ?? '/life_record_backups',
  );

  bool get isValid => serverUrl.isNotEmpty && username.isNotEmpty;
}

/// 备份文件信息
class BackupFile {
  final String name;
  final String path;
  final int size;
  final DateTime modified;

  BackupFile({
    required this.name,
    required this.path,
    required this.size,
    required this.modified,
  });
}

final webdavServiceProvider = Provider<WebDavService>((ref) {
  return WebDavService(ref);
});

class WebDavService {
  final Ref _ref;

  WebDavService(this._ref);

  static const String _configKey = 'webdav_config';

  /// 加载保存的 WebDAV 配置
  Future<WebDavConfig?> loadConfig() async {
    final db = _ref.read(databaseProvider);
    final row = await (db.select(db.appSettings)
      ..where((t) => t.key.equals(_configKey))).getSingleOrNull();
    if (row == null || row.value == null) return null;
    try {
      return WebDavConfig.fromJson(jsonDecode(row.value!));
    } catch (_) {
      return null;
    }
  }

  /// 保存 WebDAV 配置
  Future<void> saveConfig(WebDavConfig config) async {
    final db = _ref.read(databaseProvider);
    await db.into(db.appSettings).insertOnConflictUpdate(
      AppSettingsCompanion(
        key: const Value(_configKey),
        value: Value(jsonEncode(config.toJson())),
      ),
    );
  }

  /// 清除 WebDAV 配置
  Future<void> clearConfig() async {
    final db = _ref.read(databaseProvider);
    await (db.delete(db.appSettings)..where((t) => t.key.equals(_configKey))).go();
  }

  /// 测试连接
  Future<bool> testConnection(WebDavConfig config) async {
    try {
      await _listRequest(config, config.remotePath);
      return true;
    } catch (e) {
      // 如果路径不存在，尝试创建
      try {
        await _mkdir(config, config.remotePath);
        return true;
      } catch (_) {
        return false;
      }
    }
  }

  /// 立即备份到 WebDAV
  Future<String> backupNow() async {
    final config = await loadConfig();
    if (config == null || !config.isValid) {
      throw Exception('请先配置 WebDAV');
    }

    // 导出数据
    final exportService = _ref.read(exportImportServiceProvider);
    final jsonString = await _exportJsonString(exportService);

    // 构造文件名
    final timestamp = DateTime.now().toIso8601String().replaceAll(':', '-').substring(0, 19);
    final fileName = 'life_record_$timestamp.json';
    final remotePath = '${config.remotePath}/$fileName';

    // 确保目录存在
    try {
      await _mkdir(config, config.remotePath);
    } catch (_) {}

    // 上传
    final dio = _buildDio(config);
    await dio.put(
      _buildUrl(config, remotePath),
      data: utf8.encode(jsonString),
      options: Options(
        headers: {'Content-Type': 'application/json'},
      ),
    );

    return fileName;
  }

  /// 列出远程备份文件
  Future<List<BackupFile>> listBackups() async {
    final config = await loadConfig();
    if (config == null || !config.isValid) {
      throw Exception('请先配置 WebDAV');
    }

    try {
      await _mkdir(config, config.remotePath);
    } catch (_) {}

    final result = <BackupFile>[];
    final data = await _listRequest(config, config.remotePath);

    // 解析 PROPFIND XML 响应（简单正则提取）
    final responses = RegExp(r'<D:response>(.*?)</D:response>', dotAll: true).allMatches(data);
    for (final match in responses) {
      final responseXml = match.group(1)!;
      final hrefMatch = RegExp(r'<D:href>(.*?)</D:href>').firstMatch(responseXml);
      final sizeMatch = RegExp(r'<D:getcontentlength>(\d+)</D:getcontentlength>').firstMatch(responseXml);
      final modifiedMatch = RegExp(r'<D:getlastmodified>(.*?)</D:getlastmodified>').firstMatch(responseXml);

      if (hrefMatch == null) continue;
      final href = Uri.decodeFull(hrefMatch.group(1)!);
      final name = href.split('/').where((s) => s.isNotEmpty).last;
      if (!name.endsWith('.json') || !name.startsWith('life_record_')) continue;

      final size = int.tryParse(sizeMatch?.group(1) ?? '0') ?? 0;
      DateTime modified;
      try {
        modified = HttpDate.parse(modifiedMatch?.group(1) ?? '');
      } catch (_) {
        modified = DateTime.now();
      }

      result.add(BackupFile(
        name: name,
        path: href,
        size: size,
        modified: modified,
      ));
    }

    result.sort((a, b) => b.modified.compareTo(a.modified));
    return result;
  }

  /// 下载并恢复指定备份
  Future<ImportResult> restoreBackup(String remotePath) async {
    final config = await loadConfig();
    if (config == null || !config.isValid) {
      throw Exception('请先配置 WebDAV');
    }

    final dio = _buildDio(config);
    final response = await dio.get<String>(
      _buildUrl(config, remotePath.startsWith('/') ? remotePath : '/$remotePath'),
    );

    final content = response.data;
    if (content == null) {
      return ImportResult(
        success: false,
        assetsImported: 0,
        mediaItemsImported: 0,
        errors: ['下载内容为空'],
      );
    }

    final importService = _ref.read(exportImportServiceProvider);
    return importService.importFromString(content);
  }

  /// 删除远程备份文件
  Future<void> deleteBackup(String remotePath) async {
    final config = await loadConfig();
    if (config == null || !config.isValid) {
      throw Exception('请先配置 WebDAV');
    }

    final dio = _buildDio(config);
    await dio.delete(_buildUrl(config, remotePath.startsWith('/') ? remotePath : '/$remotePath'));
  }

  // ========== 内部方法 ==========

  Future<String> _exportJsonString(ExportImportService service) async {
    final assetRepo = _ref.read(assetRepositoryProvider);
    final mediaRepo = _ref.read(mediaRepositoryProvider);

    final assets = await assetRepo.getAllAssets();
    final mediaItems = await mediaRepo.getAllMediaItems();

    final exportData = {
      'version': '1.0.0',
      'exportedAt': DateTime.now().toIso8601String(),
      'assets': assets.map((a) => a.toJson()).toList(),
      'mediaItems': mediaItems.map((m) => m.toJson()).toList(),
    };
    return const JsonEncoder.withIndent('  ').convert(exportData);
  }

  Dio _buildDio(WebDavConfig config) {
    final basicAuth = 'Basic ${base64.encode(utf8.encode('${config.username}:${config.password}'))}';
    return Dio(BaseOptions(
      headers: {
        'Authorization': basicAuth,
      },
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
    ));
  }

  String _buildUrl(WebDavConfig config, String path) {
    var url = config.serverUrl;
    if (!url.endsWith('/') && !path.startsWith('/')) {
      url += '/';
    }
    return '$url${path.replaceFirst(RegExp(r'^/+'), '')}';
  }

  Future<String> _listRequest(WebDavConfig config, String path) async {
    final dio = _buildDio(config);
    final response = await dio.request(
      _buildUrl(config, path),
      options: Options(
        method: 'PROPFIND',
        headers: {'Depth': '1'},
      ),
    );
    return response.data.toString();
  }

  Future<void> _mkdir(WebDavConfig config, String path) async {
    final dio = _buildDio(config);
    final url = _buildUrl(config, path);
    // 用 MKCOL 创建集合
    try {
      await dio.request(url, options: Options(method: 'MKCOL'));
    } on DioException catch (e) {
      // 405 = 已存在，409 = 路径部分不存在（允许）
      if (e.response?.statusCode != 405 && e.response?.statusCode != 301) {
        rethrow;
      }
    }
  }
}
