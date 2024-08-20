import 'package:flutter/material.dart';

import '../components/index.dart';
import '../views/home/index.dart';
import '../views/profile/index.dart';

/// 路由名称
const Map<String, String> routerNames = {
  'Home': '/',
  'Profile': 'profile',
};

/// 路由配置
final Map<String, Widget Function(BuildContext)> router = {
  routerNames['Home']!: (context) => const MainLayout(
        hasHeader: true,
        hasBottomNavBar: true,
        child: HomeScreen(),
      ),
  routerNames['Profile']!: (context) => const MainLayout(
        hasHeader: true,
        hasBottomNavBar: true,
        child: ProfileScreen(),
      )
};
