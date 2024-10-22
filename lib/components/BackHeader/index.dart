import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../utils/locale.dart';
import '../../themes/utils.dart';

/// 自适应头部组件
class BackHeader extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leftChild;
  final Widget? rightChild;
  final String? pageTitle;
  final TextStyle? pageTitleStyle;
  final bool? isBackButton;
  final double? height;

  const BackHeader({
    super.key,
    this.leftChild,
    this.rightChild,
    this.pageTitle,
    this.pageTitleStyle,
    this.isBackButton = true,
    this.height,
  });

  @override
  Size get preferredSize => const Size.fromHeight(72.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: height ?? preferredSize.height,
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 左边的内容
          if (leftChild != null)
            leftChild!
          else
            isBackButton!
                ? IconButton(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    iconSize: 20.0,
                    icon: const FaIcon(FontAwesomeIcons.arrowLeft),
                    onPressed: () => context.pop(),
                  )
                : const SizedBox.shrink(),
          // 中间的内容
          Expanded(
            child: Center(
              child: pageTitle != null
                  ? Text(
                      pageTitle!,
                      style: pageTitleStyle,
                    )
                  : const SizedBox.shrink(),
            ),
          ),
          if (rightChild != null) rightChild! else const SizedBox.shrink()
        ],
      ),
    );
  }
}
