/// 服务集合（统一管理所有服务）
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'export_import_service.dart';
import 'api_search_service.dart';
import 'image_service.dart';
import 'notification_service.dart';
import 'settings_service.dart';

/// 服务集合提供者
final servicesProvider = Provider<Services>((ref) {
  return Services(ref);
});

class Services {
  final Ref _ref;
  late final ExportImportService exportImport;
  late final ApiSearchService apiSearch;
  late final ImageService image;
  late final NotificationService notification;
  late final SettingsService settings;

  Services(this._ref) {
    exportImport = _ref.read(exportImportServiceProvider);
    apiSearch = _ref.read(apiSearchServiceProvider);
    image = ImageService();
    notification = _ref.read(notificationServiceProvider);
    settings = _ref.read(settingsServiceProvider);
  }
}