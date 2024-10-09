import 'package:code_app/utils/device.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../components/index.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _iponeController = TextEditingController();

  void _submit() {
    print('object');
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
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: DeviceUtils.getScreenSize(context).height * 0.18),
            SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    "手机号登录",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: DeviceUtils.getScreenSize(context).height * 0.04,
                  ),
                  InputField(
                    leftWidget: const Icon(Icons.phone),
                    hintText: '请输入手机号码',
                    textEditingController: _iponeController,
                  ),
                  const SizedBox(height: 24),
                  InputField(
                    leftWidget: const Icon(Icons.phone),
                    hintText: '请输入手机号码',
                    textEditingController: _iponeController,
                  ),
                  const SizedBox(height: 24),
                  Button(
                    icon: const Icon(Icons.arrow_forward, color: Colors.white),
                    onPressed: _submit,
                    type: ButtonType.circular,
                    width: 60,
                    height: 60,
                  ),
                  const SizedBox(height: 24),
                  Button(
                    icon: const Icon(Icons.arrow_forward),
                    onPressed: _submit,
                    buttonText: '按钮',
                    type: ButtonType.border,
                  ),
                  const SizedBox(height: 24),
                  Button(
                    icon: const Icon(Icons.arrow_forward, color: Colors.white),
                    onPressed: _submit,
                    buttonText: '按钮',
                    iconPosition: IconPosition.left,
                    type: ButtonType.primary,
                  ),
                  const SizedBox(height: 24),
                  Button(
                    icon: const Icon(Icons.arrow_forward),
                    onPressed: _submit,
                    buttonText: '按钮',
                    type: ButtonType.text,
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
