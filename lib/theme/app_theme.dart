/// 应用主题配置
library;

import 'package:flutter/material.dart';

/// 主题模式
enum AppThemeMode {
  light('亮色'),
  dark('暗色'),
  system('跟随系统');

  final String label;
  const AppThemeMode(this.label);
}

/// 应用主题
class AppTheme {
  // 精选主色调（避免过于鲜艳的原色）
  static const List<Color> primaryColors = [
    Color(0xFF5B7FFF), // 蓝紫
    Color(0xFF00BFA6), // 青绿
    Color(0xFF4CAF50), // 绿
    Color(0xFFFF8A3D), // 暖橙
    Color(0xFF9C6BFF), // 紫
    Color(0xFFEC5B8A), // 粉
    Color(0xFFEF4444), // 红
    Color(0xFF3B82F6), // 靛蓝
  ];

  /// 亮色主题
  static ThemeData lightTheme({Color? primaryColor}) {
    final color = primaryColor ?? const Color(0xFF5B7FFF);
    final scheme = ColorScheme.fromSeed(
      seedColor: color,
      brightness: Brightness.light,
    );
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: scheme,
      scaffoldBackgroundColor: const Color(0xFFF7F8FA),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0.5,
        backgroundColor: Colors.transparent,
        foregroundColor: const Color(0xFF1A1D29),
        titleTextStyle: TextStyle(
          color: const Color(0xFF1A1D29),
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        iconTheme: IconThemeData(color: const Color(0xFF1A1D29), size: 22),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: Colors.white,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: EdgeInsets.zero,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: color,
        foregroundColor: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFFF0F2F5),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        labelStyle: TextStyle(color: Colors.grey.shade600, fontSize: 14),
        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: color, width: 2),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: const Color(0xFFF0F2F5),
        selectedColor: color.withValues(alpha: 0.15),
        labelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 8,
        height: 68,
        indicatorColor: color.withValues(alpha: 0.12),
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return TextStyle(
            fontSize: 12,
            fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
            color: selected ? color : Colors.grey.shade600,
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return IconThemeData(
            size: 24,
            color: selected ? color : Colors.grey.shade500,
          );
        }),
      ),
      dividerTheme: DividerThemeData(
        color: Colors.black.withValues(alpha: 0.06),
        thickness: 1,
        space: 1,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, height: 1.2),
        titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, height: 1.2),
        titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, height: 1.3),
        bodyLarge: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, height: 1.4),
        bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, height: 1.4),
        bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, height: 1.4),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: const Color(0xFF2D3142),
        contentTextStyle: const TextStyle(color: Colors.white, fontSize: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  /// 暗色主题
  static ThemeData darkTheme({Color? primaryColor}) {
    final color = primaryColor ?? const Color(0xFF5B7FFF);
    final scheme = ColorScheme.fromSeed(
      seedColor: color,
      brightness: Brightness.dark,
    );
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: scheme,
      scaffoldBackgroundColor: const Color(0xFF0E1117),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0.5,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        iconTheme: const IconThemeData(color: Colors.white, size: 22),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: const Color(0xFF1A1F2E),
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: EdgeInsets.zero,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: color,
        foregroundColor: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF242A3D),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        labelStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
        hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: color, width: 2),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: const Color(0xFF242A3D),
        selectedColor: color.withValues(alpha: 0.2),
        labelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: const Color(0xFF141821),
        surfaceTintColor: Colors.transparent,
        elevation: 8,
        height: 68,
        indicatorColor: color.withValues(alpha: 0.18),
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return TextStyle(
            fontSize: 12,
            fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
            color: selected ? color : Colors.grey.shade500,
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return IconThemeData(
            size: 24,
            color: selected ? color : Colors.grey.shade500,
          );
        }),
      ),
      dividerTheme: DividerThemeData(
        color: Colors.white.withValues(alpha: 0.08),
        thickness: 1,
        space: 1,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, height: 1.2),
        titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, height: 1.2),
        titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, height: 1.3),
        bodyLarge: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, height: 1.4),
        bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, height: 1.4),
        bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, height: 1.4),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: const Color(0xFFE5E7EB),
        contentTextStyle: const TextStyle(color: Color(0xFF1A1D29), fontSize: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  /// 根据模式获取主题
  static ThemeData getTheme(AppThemeMode mode, {Color? primaryColor}) {
    switch (mode) {
      case AppThemeMode.light:
        return lightTheme(primaryColor: primaryColor);
      case AppThemeMode.dark:
        return darkTheme(primaryColor: primaryColor);
      case AppThemeMode.system:
        return lightTheme(primaryColor: primaryColor);
    }
  }
}
