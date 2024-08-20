import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// 自适应头部组件
class AdaptiveHeader extends StatelessWidget implements PreferredSizeWidget {
  final String avatarUrl;
  final String name;
  final String signature;

  const AdaptiveHeader({
    super.key,
    this.avatarUrl =
        'https://lzd-img-global.slatic.net/g/tps/imgextra/i1/O1CN01bCJNwD1h9gIvDwbkK_!!6000000004235-2-tps-24-25.png',
    this.name = 'John Doe',
    this.signature = 'I am a developer',
  });

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Text(name),
                  Text(signature),
                ],
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.language),
                onPressed: () {
                  // 处理多语言切换的路由跳转
                  context.go('/language');
                },
              ),
              IconButton(
                icon: const Icon(Icons.brightness_4),
                onPressed: () {
                  // 处理主题切换的逻辑
                },
              ),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  // 处理搜索的路由跳转
                  context.go('/search');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
