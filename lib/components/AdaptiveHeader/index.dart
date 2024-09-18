import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../utils/locale.dart';

/// 自适应头部组件
class AdaptiveHeader extends StatelessWidget implements PreferredSizeWidget {
  final String avatarUrl;
  final String name;
  final String signature;
  final bool? isBackHeader;
  final Color? color;

  const AdaptiveHeader({
    super.key,
    this.avatarUrl =
        'https://lzd-img-global.slatic.net/g/tps/imgextra/i1/O1CN01bCJNwD1h9gIvDwbkK_!!6000000004235-2-tps-24-25.png',
    this.name = 'John Doe',
    this.signature = 'I am a developer',
    this.isBackHeader = false,
    this.color,
  });

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    if (isBackHeader == true) {
      return Container(
        height: preferredSize.height,
        color: color ?? Theme.of(context).primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    context.pop();
                  },
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.message),
                  onPressed: () {
                    // context.go('/language');
                  },
                ),
              ],
            ),
          ],
        ),
      );
    }
    return Container(
        height: preferredSize.height,
        color: color ?? Theme.of(context).primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(avatarUrl),
                  ),
                  const SizedBox(width: 8.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: const TextStyle(fontSize: 12)),
                      Text(signature, style: const TextStyle(fontSize: 8)),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    iconSize: 20.0,
                    icon: const Icon(Icons.language),
                    onPressed: () => LocaleUtils.setLocale(context),
                  ),
                  IconButton(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    iconSize: 20.0,
                    icon: const Icon(Icons.brightness_4),
                    onPressed: () {
                      // 处理主题切换的逻辑
                    },
                  ),
                  IconButton(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    iconSize: 20.0,
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      // 处理搜索的路由跳转
                      // context.go('/search');
                    },
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
