/// 数据导出导入服务
library;

import 'dart:convert';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:file_picker/file_picker.dart';
import 'package:share_plus/share_plus.dart';

// Web 专用导入
import 'web_download.dart' if (dart.library.io) 'web_download_stub.dart';

import '../models/asset.dart';
import '../models/media_item.dart';
import '../providers/asset_providers.dart';
import '../providers/media_providers.dart';
import 'file_io.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final exportImportServiceProvider = Provider<ExportImportService>((ref) {
  return ExportImportService(ref);
});

class ExportImportService {
  final Ref _ref;

  ExportImportService(this._ref);

  /// 导出全部数据为 JSON
  Future<String> exportToJson() async {
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

    final jsonString = const JsonEncoder.withIndent('  ').convert(exportData);

    // Web 端直接返回 JSON 字符串
    if (kIsWeb) {
      return jsonString;
    }

    // 移动端保存到临时文件
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final filePath = await FileIO.writeTempJson(jsonString, 'life_record_$timestamp.json');

    return filePath;
  }

  /// 分享导出的文件
  Future<void> shareExport() async {
    final result = await exportToJson();

    if (kIsWeb) {
      // Web 端通过浏览器下载 JSON 文件
      downloadTextFile(result, 'life_record_${DateTime.now().millisecondsSinceEpoch}.json');
    } else {
      await Share.shareXFiles(
        [XFile(result)],
        text: '生活记录数据导出',
      );
    }
  }
  
  /// 从 JSON 导入数据
  Future<ImportResult> importFromJson() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['json'],
      withData: kIsWeb, // Web 端需要 withData
    );

    if (result == null || result.files.isEmpty) {
      return ImportResult(
        success: false,
        assetsImported: 0,
        mediaItemsImported: 0,
        errors: ['未选择文件'],
      );
    }

    String content;
    if (kIsWeb) {
      // Web 端从 bytes 读取
      content = String.fromCharCodes(result.files.first.bytes!);
    } else {
      // 移动端从文件路径读取
      content = await FileIO.readTextFromPath(result.files.first.path!);
    }

    return importFromString(content);
  }
  
  /// 从字符串导入
  Future<ImportResult> importFromString(String jsonString) async {
    final errors = <String>[];
    int assetsImported = 0;
    int mediaItemsImported = 0;
    
    try {
      final data = jsonDecode(jsonString) as Map<String, dynamic>;
      
      final assetRepo = _ref.read(assetRepositoryProvider);
      final mediaRepo = _ref.read(mediaRepositoryProvider);
      
      // 导入资产
      if (data['assets'] != null) {
        for (final assetJson in data['assets'] as List) {
          try {
            final asset = Asset.fromJson(assetJson as Map<String, dynamic>);
            // 检查是否已存在（通过ID）
            final existing = await assetRepo.getAssetById(asset.id);
            if (existing == null) {
              await assetRepo.insertAsset(asset);
              assetsImported++;
            }
          } catch (e) {
            errors.add('资产导入失败: $e');
          }
        }
      }
      
      // 导入娱乐记录
      if (data['mediaItems'] != null) {
        for (final itemJson in data['mediaItems'] as List) {
          try {
            final item = MediaItem.fromJson(itemJson as Map<String, dynamic>);
            final existing = await mediaRepo.getMediaItemById(item.id);
            if (existing == null) {
              await mediaRepo.insertMediaItem(item);
              mediaItemsImported++;
            }
          } catch (e) {
            errors.add('娱乐记录导入失败: $e');
          }
        }
      }
      
      // 刷新缓存
      _ref.invalidate(assetRepositoryProvider);
      _ref.invalidate(mediaRepositoryProvider);
      
      return ImportResult(
        success: true,
        assetsImported: assetsImported,
        mediaItemsImported: mediaItemsImported,
        errors: errors,
      );
    } catch (e) {
      return ImportResult(
        success: false,
        assetsImported: 0,
        mediaItemsImported: 0,
        errors: ['JSON 解析失败: $e'],
      );
    }
  }
}

class ImportResult {
  final bool success;
  final int assetsImported;
  final int mediaItemsImported;
  final List<String> errors;
  
  ImportResult({
    required this.success,
    required this.assetsImported,
    required this.mediaItemsImported,
    required this.errors,
  });
  
  String get summary {
    if (!success) {
      return '导入失败: ${errors.join('; ')}';
    }
    return '导入成功: 资产 $assetsImported 条, 娱乐记录 $mediaItemsImported 条${errors.isNotEmpty ? '\n警告: ${errors.length} 条' : ''}';
  }
}