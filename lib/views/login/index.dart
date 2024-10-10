import 'package:code_app/utils/device.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../components/index.dart';
import 'constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _iponeController = TextEditingController();
  late Map<String, dynamic> _selectedData = loginIconAndText[0];

  void _submit() {
    print('object');
  }

  void _onButtonGroupChange(Map<String, dynamic> item, int? index) {
    setState(() {
      _selectedData = loginIconAndText[index ?? 0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: DeviceUtils.getScreenSize(context).height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('./images/login-bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            BackHeader(
              rightChild: TextButton(
                onPressed: () {},
                child: const Text(
                  '账号登录',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: DeviceUtils.getScreenSize(context).height * 0.18),
            SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    _selectedData['text'] ?? '',
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: DeviceUtils.getScreenSize(context).height * 0.04,
                  ),
                  InputField(
                    leftWidget: FaIcon(
                      FontAwesomeIcons.phone,
                      size: 20,
                      color: Theme.of(context).primaryColor,
                    ),
                    hintText: _selectedData['hintText'] ?? '',
                    textEditingController: _iponeController,
                  ),
                  const SizedBox(height: 24),
                  InputField(
                    leftWidget: const Icon(Icons.phone),
                    hintText: '请输入手机号码',
                    textEditingController: _iponeController,
                  ),
                  const SizedBox(height: 32),
                  Button(
                    icon: const Icon(Icons.arrow_forward, color: Colors.white),
                    onPressed: _submit,
                    type: ButtonType.circular,
                    isBoxShadow: true,
                    width: 60,
                  ),
                  const SizedBox(height: 32),
                  ButtonGroup(
                    loginOptions: loginIconAndText,
                    onChange: (item, index) =>
                        _onButtonGroupChange(item, index),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
