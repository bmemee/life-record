/// 主页面（带底部导航）
library;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/app_bottom_nav.dart';

class HomePage extends StatelessWidget {
  final Widget child;

  const HomePage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: AppBottomNav(
        currentIndex: _calculateSelectedIndex(context),
        onTap: (index) => _onItemTapped(index, context),
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    if (location.startsWith('/assets')) return 0;
    if (location.startsWith('/media')) return 1;
    if (location.startsWith('/stats')) return 2;
    if (location.startsWith('/settings')) return 3;
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go('/assets');
        break;
      case 1:
        context.go('/media');
        break;
      case 2:
        context.go('/stats');
        break;
      case 3:
        context.go('/settings');
        break;
    }
  }
}
