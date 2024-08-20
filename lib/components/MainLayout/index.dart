import 'package:flutter/material.dart';

import '../index.dart';

/// 主布局组件
class MainLayout extends StatelessWidget {
  final bool hasHeader;
  final bool hasBottomNavBar;
  final Widget child;
  const MainLayout({
    super.key,
    this.hasHeader = false,
    this.hasBottomNavBar = false,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: child,
        appBar: hasHeader ? const AdaptiveHeader() : null,
        bottomNavigationBar: hasBottomNavBar ? const BottomNavBar() : null,
      ),
    );
  }
}
