import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/index.dart';
import '../../modules/change_notifier.dart';
import '../profile/index.dart';
import '../home/index.dart';
import '../tools/index.dart';
import '../../utils//device.dart';

final List<Widget> _pages = [
  const HomeScreen(),
  const ToolsScreen(),
  const ProfileScreen()
];

/// 主布局组件
class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final int bottomNavBarIndex = context.watch<Counter>().bottomNavBarIndex;
    final bool isLargeScreen = DeviceUtils.isLargeScreen(context);
    final List<Map<String, dynamic>> listItem = [
      {
        "icon": const Icon(Icons.home),
        "label": context.tr('home'),
      },
      {
        "icon": const Icon(Icons.adf_scanner_rounded),
        "label": context.tr('tools')
      },
      {
        "icon": const Icon(Icons.settings),
        "label": context.tr('profile'),
      },
    ];
    return ImmersiveHeader(
      child: Scaffold(
        extendBody: true,
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
        bottomNavigationBar: isLargeScreen
            ? const LargeScreenFooter()
            : BottomNavBar(
                selectedIndex: bottomNavBarIndex,
                listItem: listItem,
              ),
      ),
    );
  }
}
