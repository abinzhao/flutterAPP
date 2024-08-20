import 'package:flutter/material.dart';
import '../../router/index.dart';
import '../../router/utils.dart';

/// 底部导航栏
class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<BottomNavigationBarItem> _items = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: '个人中心'),
    // 添加更多的导航项
  ];

  void routerServiceGo(
      BuildContext context, String routerNames, Function onSuccess) {
    RouterService.go(context, routerNames, onSuccess: onSuccess);
  }

  void _onItemTapped(BuildContext context, int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        routerServiceGo(context, routerNames['Home']!, () {
          setState(() {
            _selectedIndex = index;
          });
        });
        break;
      case 1:
        routerServiceGo(context, routerNames['Profile']!, () {
          setState(() {
            _selectedIndex = index;
          });
        });
        break;
      // 处理更多导航项的跳转
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: _items,
      currentIndex: _selectedIndex,
      onTap: (index) {
        _onItemTapped(context, index);
      },
    );
  }
}
