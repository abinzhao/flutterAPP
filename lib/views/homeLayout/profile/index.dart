import 'package:code_app/utils/device.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../../components/index.dart';
import '../../login/login_utils.dart';

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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ImagePreview(
                      imageUrl:
                          'https://pic1.zhimg.com/80/v2-3a6e134166a08b6e4600ebf02dd50298_1440w.webp',
                      width: 80,
                      height: 80,
                      boxShape: BoxShape.circle,
                    ),
                    SizedBox(width: 12),
                    Column(
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
                        // Text('此处为标签🏷️'),
                        Tag(
                          content: '一级会员',
                          colorType: TagColorType.success,
                          hasBorder: true,
                        )
                      ],
                    )
                  ],
                ),
                TextButton(onPressed: () => {}, child: const Text('更多操作'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
