/// 应用路由配置
library;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pages/home_page.dart';
import '../pages/assets/assets_list_page.dart';
import '../pages/media/media_list_page.dart';
import '../pages/stats/stats_page.dart';
import '../pages/settings/settings_page.dart';

/// 路由配置提供者
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return HomePage(child: child);
        },
        routes: [
          GoRoute(
            path: '/',
            redirect: (_, __) => '/assets',
          ),
          GoRoute(
            path: '/assets',
            name: 'assets',
            builder: (context, state) => const AssetsListPage(),
            routes: [
              GoRoute(
                path: 'add',
                name: 'add-asset',
                builder: (context, state) => const Scaffold(
                  body: Center(child: Text('添加资产')),
                ),
              ),
              GoRoute(
                path: ':id',
                name: 'asset-detail',
                builder: (context, state) {
                  final id = state.pathParameters['id']!;
                  return Scaffold(
                    body: Center(child: Text('资产详情: $id')),
                  );
                },
              ),
            ],
          ),
          GoRoute(
            path: '/media',
            name: 'media',
            builder: (context, state) => const MediaListPage(),
            routes: [
              GoRoute(
                path: 'add',
                name: 'add-media',
                builder: (context, state) => const Scaffold(
                  body: Center(child: Text('添加娱乐记录')),
                ),
              ),
              GoRoute(
                path: ':id',
                name: 'media-detail',
                builder: (context, state) {
                  final id = state.pathParameters['id']!;
                  return Scaffold(
                    body: Center(child: Text('娱乐详情: $id')),
                  );
                },
              ),
              GoRoute(
                path: 'random',
                name: 'random-media',
                builder: (context, state) => const Scaffold(
                  body: Center(child: Text('随机推荐')),
                ),
              ),
            ],
          ),
          GoRoute(
            path: '/stats',
            name: 'stats',
            builder: (context, state) => const StatsPage(),
          ),
          GoRoute(
            path: '/settings',
            name: 'settings',
            builder: (context, state) => const SettingsPage(),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('页面未找到: ${state.error}'),
      ),
    ),
  );
});