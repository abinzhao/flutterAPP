import 'package:code_app/views/error/index.dart';
import 'package:code_app/views/login/index.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../views/homeLayout/index.dart';
import '../views/homeLayout/home/index.dart';
import '../views/homeLayout/profile/index.dart';
import 'page_path.dart';
import '../views/login/login_utils.dart';

/// 路由配置
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: PagePath.layout,
      builder: (BuildContext context, GoRouterState state) {
        return FutureBuilder(
            future: LoginStorage.getLoginInfo(),
            builder: (context, snapshot) {
              if (snapshot.data?.isLogin == true) {
                return const MainHomeScreen();
              } else {
                return const LoginScreen();
              }
            });
      },
      routes: <RouteBase>[
        // GoRoute(
        //   path: PagePath.home,
        //   builder: (BuildContext context, GoRouterState state) {
        //     return const HomeScreen();
        //   },
        // ),
        // GoRoute(
        //   path: PagePath.profile,
        //   builder: (BuildContext context, GoRouterState state) {
        //     return const ProfileScreen();
        //   },
        // ),
        // GoRoute(
        //   path: PagePath.login,
        //   builder: (BuildContext context, GoRouterState state) {
        //     return const LoginScreen();
        //   },
        // ),

        /// 错误页面
        GoRoute(
          path: '*',
          builder: (BuildContext context, GoRouterState state) {
            return const ErrorScreen();
          },
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => const ErrorScreen(),
);

