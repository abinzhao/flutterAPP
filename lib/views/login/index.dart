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
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  late Map<String, dynamic> _selectedData = loginIconAndText[0];
  bool isAgreed = false;

  void _submit() {
    print('提交登录信息，账号：${_accountController.text}，验证码：${_codeController.text}');
  }

  void _onButtonGroupChange(Map<String, dynamic> item, int? index) {
    setState(() {
      _selectedData = loginIconAndText[index ?? 0];
    });
  }

  Widget buildLoginContent(BuildContext context, double height, double width) {
    return SingleChildScrollView(
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
            height: height * 0.04,
          ),
          InputField(
            leftWidget: Icon(
              FontAwesomeIcons.phone,
              size: 20,
              color: Theme.of(context).primaryColor,
            ),
            hintText: _selectedData['hintText'] ?? '',
            textEditingController: _accountController,
          ),
          SizedBox(
            height: height * 0.03,
          ),
          InputField(
            hintText: '请输入验证码',
            textEditingController: _codeController,
            type: InputType.verificationCode,
          ),
          SizedBox(
            height: height * 0.08,
          ),
          Button(
            icon: const Icon(Icons.arrow_forward, color: Colors.white),
            onPressed: _submit,
            type: ButtonType.circular,
            disabled: !isAgreed,
            isBoxShadow: true,
            width: 60,
          ),
          SizedBox(
            height: height * 0.08,
          ),
          ButtonGroup(
            loginOptions: loginIconAndText,
            onChange: (item, index) => _onButtonGroupChange(item, index),
          ),
          SizedBox(
            height: height * 0.04,
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
                buttonText: '同意《开发者用户协议》《隐私政策》',
                textStyle: const TextStyle(fontSize: 12),
                padding: const EdgeInsets.all(0),
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
      appBar: BackHeader(
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
      backgroundDecoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('./images/login-bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: largeScreen
            ? Row(
                children: [
                  // 左侧内容待定部分
                  Container(
                    width: width * 0.3,
                    color: Colors.grey[200],
                  ),
                  SizedBox(width: width * 0.01),
                  Card(
                    elevation: 4,
                    child: Container(
                      width: width * 0.5,
                      child: Column(
                        children: [
                          SizedBox(height: height * 0.18),
                          buildLoginContent(context, height, width),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : Container(
                width: width * 0.75,
                child: Column(
                  children: [
                    SizedBox(height: height * 0.18),
                    buildLoginContent(context, height, width),
                  ],
                ),
              ),
      ),
    );
  }
}
