/// 应用设置服务
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart';

import '../database/app_database.dart';
import '../providers/app_providers.dart';

final settingsServiceProvider = Provider<SettingsService>((ref) {
  return SettingsService(ref);
});

class SettingsService {
  final Ref _ref;

  SettingsService(this._ref);

  /// 获取设置值
  Future<String?> getSetting(String key) async {
    final db = _ref.read(databaseProvider);
    final result = await (db.select(db.appSettings)
      ..where((t) => t.key.equals(key))).getSingleOrNull();
    return result?.value;
  }

  /// 保存设置值
  Future<void> setSetting(String key, String value) async {
    final db = _ref.read(databaseProvider);
    await db.into(db.appSettings).insertOnConflictUpdate(
      AppSettingsCompanion(
        key: Value(key),
        value: Value(value),
      ),
    );
  }

  /// 删除设置
  Future<void> deleteSetting(String key) async {
    final db = _ref.read(databaseProvider);
    await (db.delete(db.appSettings)..where((t) => t.key.equals(key))).go();
  }

  // API Keys
  Future<String?> getTmdbApiKey() => getSetting('tmdb_api_key');
  Future<void> setTmdbApiKey(String key) => setSetting('tmdb_api_key', key);

  Future<String?> getIgdbClientId() => getSetting('igdb_client_id');
  Future<void> setIgdbClientId(String id) => setSetting('igdb_client_id', id);

  Future<String?> getIgdbClientSecret() => getSetting('igdb_client_secret');
  Future<void> setIgdbClientSecret(String secret) => setSetting('igdb_client_secret', secret);

  // 提醒天数
  Future<int> getReminderDays() async {
    final value = await getSetting('reminder_days');
    return int.tryParse(value ?? '') ?? 3;
  }

  Future<void> setReminderDays(int days) => setSetting('reminder_days', days.toString());

  // 主题设置
  Future<void> saveThemeMode(String mode) => setSetting('theme_mode', mode);
  Future<String?> loadThemeMode() => getSetting('theme_mode');

  Future<void> savePrimaryColor(String color) => setSetting('primary_color', color);
  Future<String?> loadPrimaryColor() => getSetting('primary_color');

  // 货币设置
  Future<void> saveCurrency(String currency) => setSetting('currency', currency);
  Future<String?> loadCurrency() => getSetting('currency');
}