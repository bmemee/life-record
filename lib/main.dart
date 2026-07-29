/// 应用主入口
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'router/app_router.dart';
import 'theme/app_theme.dart';
import 'providers/app_providers.dart';
import 'services/settings_service.dart';
import 'services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final container = ProviderContainer();
  // 启动时加载保存的主题设置
  final settings = container.read(settingsServiceProvider);
  try {
    final savedTheme = await settings.loadThemeMode();
    final savedColor = await settings.loadPrimaryColor();
    if (savedTheme != null) {
      container.read(themeModeProvider.notifier).state = savedTheme;
    }
    if (savedColor != null) {
      container.read(primaryColorProvider.notifier).state = savedColor;
    }
  } catch (_) {}

  // 初始化通知服务
  try {
    await container.read(notificationServiceProvider).initialize();
  } catch (_) {}

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const LifeRecordApp(),
    ),
  );
}

/// 应用根组件
class LifeRecordApp extends ConsumerWidget {
  const LifeRecordApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final themeModeStr = ref.watch(themeModeProvider);
    final primaryColorStr = ref.watch(primaryColorProvider);

    final themeMode = AppThemeMode.values.firstWhere(
      (mode) => mode.name == themeModeStr,
      orElse: () => AppThemeMode.system,
    );

    final primaryColor = _parseColor(primaryColorStr);

    return MaterialApp.router(
      title: '生活记录',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(primaryColor: primaryColor),
      darkTheme: AppTheme.darkTheme(primaryColor: primaryColor),
      themeMode: _getMaterialThemeMode(themeMode),
      routerConfig: router,
    );
  }

  ThemeMode _getMaterialThemeMode(AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
      case AppThemeMode.system:
        return ThemeMode.system;
    }
  }

  Color _parseColor(String colorStr) {
    try {
      return Color(int.parse(colorStr.replaceFirst('#', ''), radix: 16));
    } catch (_) {
      return Colors.blue;
    }
  }
}