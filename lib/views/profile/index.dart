import 'package:code_app/utils/device.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../components/index.dart';
import '../login/login_utils.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: DeviceUtils.getScreenSize(context).height,
      width: DeviceUtils.getScreenSize(context).width * 0.9,
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      child: SingleChildScrollView(
        child: Column(
          children: [
            BackHeader(
              leftChild: Text(
                context.tr("myself"),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              rightChild: Row(
                children: [
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.rightFromBracket),
                    onPressed: () {
                      LoginStorage.logout();
                      context.go('/login');
                    },
                  ),
                  const SizedBox(width: 6),
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.gear),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: Image.network(
                        "https://wx2.sinaimg.cn/mw690/d315af46ly1hnn5btbjr5j20j60j7mzv.jpg",
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                        errorBuilder: (context, error, stackTrace) {
                          return Text('图片加载错误');
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '阿斌',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '软件账号:143****1234',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text('此处为标签🏷️'),
                      ],
                    )
                  ],
                ),
                const SizedBox(width: 6)
              ],
            )
          ],
        ),
      ),
    );
  }
}
