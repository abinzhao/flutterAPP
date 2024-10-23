import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../modules/change_notifier.dart';

/// 底部导航栏
class BottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final List<Map<String, dynamic>> listItem;

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
  Size get preferredSize => const Size.fromHeight(72.0);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _scaleAnimation =
        Tween<double>(begin: 0.8, end: 1.2).animate(_animationController);
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
    return Container(
      height: preferredSize.height,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BottomNavigationBar(
          key: _bottomNavigationKey,
          backgroundColor: Colors.transparent,
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
                      child: item["icon"],
                    )
                  : item["icon"],
              label: item["label"],
            );
          }).toList(),
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          selectedItemColor:
              Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
          unselectedItemColor:
              Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
          selectedLabelStyle:
              Theme.of(context).bottomNavigationBarTheme.selectedLabelStyle,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          elevation: 0,
          iconSize: 24,
        ),
      ),
    );
  }
}
