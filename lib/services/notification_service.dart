/// 智能提醒服务
library;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/asset.dart';
import '../providers/asset_providers.dart';

final notificationServiceProvider = Provider<NotificationService>((ref) {
  return NotificationService();
});

class NotificationService {
  final FlutterLocalNotificationsPlugin _plugin = FlutterLocalNotificationsPlugin();
  bool _initialized = false;

  /// 初始化通知
  Future<void> initialize() async {
    if (_initialized || kIsWeb) return;

    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosInit = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const initSettings = InitializationSettings(
      android: androidInit,
      iOS: iosInit,
    );

    await _plugin.initialize(initSettings);
    _initialized = true;
  }

  /// 检查并发送即将到期的提醒
  Future<int> checkUpcomingRenewals(WidgetRef ref) async {
    if (kIsWeb) {
      // Web 端不支持本地通知，返回 0
      return 0;
    }

    await initialize();

    final assetRepo = ref.read(assetRepositoryProvider);
    final upcomingAssets = await assetRepo.getUpcomingRenewals(7);

    int notified = 0;
    for (final asset in upcomingAssets) {
      if (asset.nextRenewalDate == null) continue;
      final daysUntil = asset.nextRenewalDate!.difference(DateTime.now()).inDays;

      if (daysUntil <= asset.reminderDays) {
        await _showNotification(
          id: asset.id.hashCode,
          title: '订阅续费提醒',
          body: '${asset.name} 将在 $daysUntil 天后续费 ¥${(asset.billingAmount ?? 0).toStringAsFixed(2)}',
        );
        notified++;
      }
    }

    // 检查免费试用到期
    final allAssets = await assetRepo.getAllAssets();
    for (final asset in allAssets) {
      if (asset.trialEndDate == null) continue;
      final daysUntil = asset.trialEndDate!.difference(DateTime.now()).inDays;

      if (daysUntil <= asset.reminderDays && daysUntil >= 0) {
        await _showNotification(
          id: asset.id.hashCode + 1000000,
          title: '免费试用即将结束',
          body: '${asset.name} 的免费试用将在 $daysUntil 天后结束',
        );
        notified++;
      }
    }

    return notified;
  }

  /// 发送通知
  Future<void> _showNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    if (kIsWeb) return;

    const androidDetails = AndroidNotificationDetails(
      'life_record_channel',
      '生活记录通知',
      channelDescription: '资产续费、免费试用到期等提醒',
      importance: Importance.high,
      priority: Priority.high,
    );

    const iosDetails = DarwinNotificationDetails();

    const details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _plugin.show(id, title, body, details);
  }

  /// 取消所有通知
  Future<void> cancelAll() async {
    if (kIsWeb) return;
    await _plugin.cancelAll();
  }
}