import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/index.dart';
import '../../models/change_notifier.dart';
import '../profile/index.dart';
import '../home/index.dart';
import '../tools/index.dart';

final List<Widget> _pages = [
  const HomeScreen(),
  const ToolsScreen(),
  const ProfileScreen(),
];

/// 主布局组件
class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final int bottomNavBarIndex = context.watch<Counter>().bottomNavBarIndex;
    return Scaffold(
      body: SafeArea(child: _pages[bottomNavBarIndex]),
      appBar: const AdaptiveHeader(),
      bottomNavigationBar: BottomNavBar(selectedIndex: bottomNavBarIndex),
    );
  }
}
