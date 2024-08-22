import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/change_notifier.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

/// 底部导航栏
class BottomNavBar extends StatefulWidget {
  final int selectedIndex;
  const BottomNavBar({super.key, required this.selectedIndex});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
     
  static const _list = <Widget>[
    Icon(Icons.home, size: 30),
    Icon(Icons.call_split, size: 30),
    Icon(Icons.perm_identity, size: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      key: _bottomNavigationKey,
      index: 0,
      items: _list,
      color: const Color(0xFFF2FAFC),
      buttonBackgroundColor: const Color(0xFFF2FAFC),
      backgroundColor: Colors.transparent,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 500),
      height: 60,
      onTap: (index) {
        context.read<Counter>().onChangeBottomNavBarIndex(index);
      },
      letIndexChange: (index) => true,
    );
  }
}
