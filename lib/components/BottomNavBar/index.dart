import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/change_notifier.dart';

/// 底部导航栏
class BottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final List<BottomNavigationBarItem> listItem;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.listItem,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  final GlobalKey _bottomNavigationKey = GlobalKey();

  /// 底部导航栏高度
  final navBarHeight = 56.0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 1.2).animate(_animationController);
    // 默认激活项触发动画
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Stack(
          children: [
            BottomNavigationBar(
              key: _bottomNavigationKey,
              currentIndex: widget.selectedIndex,
              onTap: (index) {
                _animationController.reset();
                _animationController.forward();
                context.read<Counter>().onChangeBottomNavBarIndex(index);
              },
              items: widget.listItem.map((item) {
                final isSelected =
                    widget.selectedIndex == widget.listItem.indexOf(item);
                return BottomNavigationBarItem(
                  icon: isSelected
                      ? ScaleTransition(
                          scale: _scaleAnimation,
                          child: item.icon,
                        )
                      : item.icon,
                  label: item.label,
                );
              }).toList(),
              type: BottomNavigationBarType.fixed,
              selectedFontSize: 12,
              unselectedFontSize: 12,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              backgroundColor: const Color.fromARGB(0, 185, 29, 29),
              elevation: 0,
              iconSize: 24,
            ),
          ],
        ),
      ),
    );
  }
}
