import 'package:code_app/views/login/index.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../views/homeLayout/index.dart';
import '../views/home/index.dart';
import '../views/profile/index.dart';
import 'page_path.dart';

/// 路由名称
const Map<String, String> pathName = {
  '/': '/',
  'home': 'home',
  'profile': 'profile',
  'login': 'login',
};

/// 路由配置
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: PagePath.layout,
      builder: (BuildContext context, GoRouterState state) {
        return const MainLayout();
      },
      routes: <RouteBase>[
        GoRoute(
          path: PagePath.home,
          builder: (BuildContext context, GoRouterState state) {
            return const HomeScreen();
          },
        ),
        GoRoute(
          path: PagePath.profile,
          builder: (BuildContext context, GoRouterState state) {
            return const ProfileScreen();
          },
        ),
        GoRoute(
          path: PagePath.login,
          builder: (BuildContext context, GoRouterState state) {
            return const LoginScreen();
          },
        ),
      ],
    ),
  ],
);

