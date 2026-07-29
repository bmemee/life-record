/// 自定义底部导航栏
library;

import 'package:flutter/material.dart';

class AppBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final items = [
      _NavItem(
        icon: Icons.account_balance_wallet_outlined,
        activeIcon: Icons.account_balance_wallet,
        label: '资产',
        gradient: const [Color(0xFF5B7FFF), Color(0xFF9C6BFF)],
      ),
      _NavItem(
        icon: Icons.movie_outlined,
        activeIcon: Icons.movie,
        label: '娱乐',
        gradient: const [Color(0xFFEC4899), Color(0xFF8B5CF6)],
      ),
      _NavItem(
        icon: Icons.bar_chart_outlined,
        activeIcon: Icons.bar_chart,
        label: '统计',
        gradient: const [Color(0xFF00BFA6), Color(0xFF11998E)],
      ),
      _NavItem(
        icon: Icons.settings_outlined,
        activeIcon: Icons.settings,
        label: '设置',
        gradient: const [Color(0xFF64748B), Color(0xFF334155)],
      ),
    ];

    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF141821) : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.4 : 0.08),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          child: Row(
            children: [
              for (int i = 0; i < items.length; i++)
                Expanded(
                  child: _NavButton(
                    item: items[i],
                    selected: currentIndex == i,
                    onTap: () => onTap(i),
                    colorScheme: colorScheme,
                    isDark: isDark,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final List<Color> gradient;

  const _NavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.gradient,
  });
}

class _NavButton extends StatelessWidget {
  final _NavItem item;
  final bool selected;
  final VoidCallback onTap;
  final ColorScheme colorScheme;
  final bool isDark;

  const _NavButton({
    required this.item,
    required this.selected,
    required this.onTap,
    required this.colorScheme,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
        decoration: BoxDecoration(
          color: selected
              ? (isDark
                  ? Colors.white.withValues(alpha: 0.08)
                  : item.gradient.first.withValues(alpha: 0.1))
              : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              width: selected ? 44 : 32,
              height: selected ? 28 : 28,
              decoration: BoxDecoration(
                gradient: selected
                    ? LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: item.gradient,
                      )
                    : null,
                borderRadius: BorderRadius.circular(14),
                boxShadow: selected
                    ? [
                        BoxShadow(
                          color: item.gradient.last.withValues(alpha: 0.35),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ]
                    : null,
              ),
              child: Icon(
                selected ? item.activeIcon : item.icon,
                size: selected ? 22 : 22,
                color: selected ? Colors.white : Colors.grey.shade500,
              ),
            ),
            const SizedBox(height: 4),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              style: TextStyle(
                fontSize: selected ? 12 : 11,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                color: selected
                    ? (isDark ? Colors.white : item.gradient.first)
                    : Colors.grey.shade500,
              ),
              child: Text(item.label),
            ),
          ],
        ),
      ),
    );
  }
}
