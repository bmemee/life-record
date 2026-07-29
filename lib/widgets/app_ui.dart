/// 通用 UI 组件
library;

import 'package:flutter/material.dart';

import '../models/asset.dart';

/// 应用统一的 UI 辅助组件
class AppUI {
  AppUI._();

  /// 资产类型对应的图标
  static IconData iconForAssetType(AssetType type) {
    switch (type) {
      case AssetType.physicalItem:
        return Icons.inventory_2_outlined;
      case AssetType.subscription:
        return Icons.subscriptions_outlined;
      case AssetType.oneTimePurchase:
        return Icons.bookmark_outlined;
      case AssetType.consumable:
        return Icons.local_fire_department_outlined;
    }
  }

  /// 资产类型对应的渐变色
  static List<Color> gradientForAssetType(AssetType type) {
    switch (type) {
      case AssetType.physicalItem:
        return [const Color(0xFF667EEA), const Color(0xFF764BA2)];
      case AssetType.subscription:
        return [const Color(0xFF5B7FFF), const Color(0xFF9C6BFF)];
      case AssetType.oneTimePurchase:
        return [const Color(0xFF00BFA6), const Color(0xFF11998E)];
      case AssetType.consumable:
        return [const Color(0xFFFF8A3D), const Color(0xFFFF6B6B)];
    }
  }

  /// 状态颜色
  static Color colorForStatus(AssetStatus status) {
    switch (status) {
      case AssetStatus.active:
        return const Color(0xFF10B981);
      case AssetStatus.retired:
        return const Color(0xFF6B7280);
      case AssetStatus.sold:
        return const Color(0xFF3B82F6);
      case AssetStatus.discarded:
        return const Color(0xFFEF4444);
    }
  }

  /// 状态背景色（带透明度）
  static Color bgForStatus(AssetStatus status) {
    return colorForStatus(status).withValues(alpha: 0.12);
  }

  /// 卡片左侧装饰条
  static Widget typeIndicator(AssetType type) {
    final gradient = gradientForAssetType(type);
    return Container(
      width: 4,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: gradient,
        ),
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  /// 圆形图标容器（用于卡片头部或空状态）
  static Widget iconBadge({
    required IconData icon,
    required List<Color> gradient,
    double size = 44,
    double iconSize = 22,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradient,
        ),
        borderRadius: BorderRadius.circular(size / 2 - 2),
        boxShadow: [
          BoxShadow(
            color: gradient.last.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Icon(icon, color: Colors.white, size: iconSize),
    );
  }

  /// 小标签（用于显示金额、日期等）
  static Widget infoChip({
    required String label,
    required String value,
    Color? valueColor,
    IconData? icon,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 12, color: Colors.grey.shade600),
            const SizedBox(width: 4),
          ],
          Text(
            '$label ',
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: valueColor ?? Colors.grey.shade800,
            ),
          ),
        ],
      ),
    );
  }

  /// 区域标题（卡片内的小标题）
  static Widget sectionTitle(BuildContext context, String text, {IconData? icon}) {
    return Row(
      children: [
        if (icon != null) ...[
          Icon(icon, size: 16, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 6),
        ],
        Text(
          text,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade700,
            letterSpacing: 0.3,
          ),
        ),
      ],
    );
  }

  /// 空状态视图
  static Widget emptyState({
    required IconData icon,
    required String title,
    String? subtitle,
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 88,
              height: 88,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 40, color: Colors.grey.shade400),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade700,
              ),
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 8),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
              ),
            ],
            if (actionLabel != null && onAction != null) ...[
              const SizedBox(height: 20),
              FilledButton.icon(
                onPressed: onAction,
                icon: Icon(Icons.add, size: 18),
                label: Text(actionLabel),
              ),
            ],
          ],
        ),
      ),
    );
  }

  /// 总览统计卡片（大数字 + 标签）
  static Widget statCard({
    required BuildContext context,
    required String label,
    required String value,
    required IconData icon,
    required List<Color> gradient,
    String? subtext,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradient,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: gradient.last.withValues(alpha: 0.25),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.white.withValues(alpha: 0.9), size: 18),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.9),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w700,
              height: 1.1,
            ),
          ),
          if (subtext != null) ...[
            const SizedBox(height: 4),
            Text(
              subtext,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.8),
                fontSize: 11,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
