import 'dart:math';
import 'package:code_app/utils/device.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

import '../../components/index.dart';
import 'constants.dart';
import 'service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  late Map<String, dynamic> _selectedData = loginIconAndText[0];
  bool isAgreed = false;
  String? code = '';
  bool submitBtnDisabled = true;

  void _submit(BuildContext context) async {
    if (code == null || code!.isEmpty || _codeController.text != code) {
      toastification.show(
        context: context,
        title: Text(context.tr('codeError')),
        style: ToastificationStyle.flatColored,
        showIcon: true,
        type: ToastificationType.error,
        autoCloseDuration: const Duration(seconds: 3),
      );
      return;
    }
    final res = await sendPostRequest({
      'type': _selectedData['value'],
      'content': _accountController.text,
      'isLogin': true,
      'selectedData': _selectedData,
    });
    if (res != null && mounted) {
      context.go('/');
    }
  }

  void _onButtonGroupChange(Map<String, dynamic> item, int? index) {
    setState(() {
      _selectedData = loginIconAndText[index ?? 0];
    });
  }

  // 生成一个 6 位数的验证码
  int generateRandomSixDigitNumber() {
    Random random = Random();
    int min = 000000;
    int max = 999999;
    return min + random.nextInt(max - min + 1);
  }

  void _onSendVerificationCode() {
    final _code = generateRandomSixDigitNumber();
    setState(() {
      code = _code.toString();
    });
    toastification.show(
      context: context,
      title: Text(context.tr("loginCodeTitle")),
      description: Text('${context.tr("loginCodeText")}$_code'),
      style: ToastificationStyle.flatColored,
      showIcon: true,
      type: ToastificationType.success,
      autoCloseDuration: const Duration(seconds: 10),
    );
  }

  Widget buildLoginContent(BuildContext context, double height, double? width) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(
            "./images/logo.png",
            width: 110,
            height: 110,
            fit: BoxFit.cover,
          ),
          Text(
            _selectedData['text'] ?? '',
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: height * 0.04,
          ),
          InputField(
            leftWidget: Icon(
              _selectedData['icon'],
              size: 20,
              color: Theme.of(context).primaryColor,
            ),
            hintText: _selectedData['hintText'] ?? '',
            textEditingController: _accountController,
            width: width,
          ),
          SizedBox(
            height: height * 0.03,
          ),
          InputField(
            hintText: context.tr("sendCodeText"),
            textEditingController: _codeController,
            type: InputType.verificationCode,
            onSendVerificationCode: _onSendVerificationCode,
            width: width,
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Button(
            icon: const Icon(Icons.arrow_forward, color: Colors.white),
            onPressed: () => _submit(context),
            type: ButtonType.circular,
            disabled: !isAgreed,
            isBoxShadow: true,
            width: 60,
          ),
          SizedBox(
            height: height * 0.05,
          ),
          ButtonGroup(
            loginOptions: loginIconAndText,
            unSelectedColor: Colors.black87,
            onChange: (item, index) => _onButtonGroupChange(item, index),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Radio<bool>(
                value: true,
                activeColor: Theme.of(context).primaryColor,
                groupValue: isAgreed,
                onChanged: (value) {
                  setState(() {
                    isAgreed = value!;
                  });
                },
              ),
              Button(
                type: ButtonType.text,
                onPressed: isAgreed
                    ? null
                    : () {
                        setState(() {
                          isAgreed = true;
                        });
                      },
                buttonText: context.tr("agreePolicy"),
                textStyle: const TextStyle(fontSize: 12),
                padding: EdgeInsets.zero,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final largeScreen = DeviceUtils.isLargeScreen(context);
    final height = DeviceUtils.getScreenSize(context).height;
    final width = DeviceUtils.getScreenSize(context).width;

    return PageLayout(
      backgroundDecoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              './images/${largeScreen ? 'login-pc-bg' : 'login-bg'}.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: largeScreen
            ? Container(
                width: width * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      spreadRadius: 0.1,
                      blurRadius: 15,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Card(
                  color: Colors.white.withOpacity(0.7),
                  child: Padding(
                    padding: EdgeInsets.all(height * 0.05),
                    child: buildLoginContent(context, height, width * 0.4),
                  ),
                ),
              )
            : Container(
                width: width * 0.75,
                child: Column(
                  children: [
                    SizedBox(height: height * 0.18),
                    buildLoginContent(context, height, width * 0.8),
                  ],
                ),
              ),
      ),
    );
  }
}
