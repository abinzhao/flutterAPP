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
  const ProfileScreen()
];

final List<BottomNavigationBarItem> listItem = [
  const BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: '首页',
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.adf_scanner_rounded),
    label: '工具箱',
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.settings),
    label: '我的',
  ),
];

/// 主布局组件
class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final int bottomNavBarIndex = context.watch<Counter>().bottomNavBarIndex;
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              child: SingleChildScrollView(child: _pages[bottomNavBarIndex]),
            );
          },
        ),
        
        appBar: const AdaptiveHeader(),
        bottomNavigationBar: BottomNavBar(
          selectedIndex: bottomNavBarIndex,
          listItem: listItem,
        ),
      ),
    );
  }
}
