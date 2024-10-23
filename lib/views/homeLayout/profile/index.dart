import 'package:code_app/utils/device.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../../components/index.dart';
import '../../../storage/user.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserInfo? userInfo = UserInfo();

  void _updateUserInfo() async {
    final data = await UserStorage.getUserInfo();
    setState(() {
      userInfo = data;
    });
  }

  @override
  void initState() {
    _updateUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: DeviceUtils.getScreenSize(context).height,
      width: DeviceUtils.getScreenSize(context).width * 0.9,
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // 头部
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
                      UserStorage.logout();
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
            // 账号信息
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ImagePreview(
                      imageUrl: userInfo?.avatarUrl ?? '',
                      width: 80,
                      height: 80,
                      boxShape: BoxShape.circle,
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
                        SizedBox(height: 4),
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
            ),
            const SizedBox(height: 24),
            const ListCard(
              listItems: [
                {
                  'child': Text('我的订单'),
                  'actionIcon': FontAwesomeIcons.arrowLeft
                },
                {
                  'child': Text('我的收藏'),
                  'actionIcon': FontAwesomeIcons.arrowLeft
                },
                {
                  'child': Text('我的优惠券'),
                  'actionIcon': FontAwesomeIcons.arrowLeft
                },
              ],
            ),
          ],
        ),
      ),
    );
  }
}
