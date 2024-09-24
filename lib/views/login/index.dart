import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../components/index.dart';
import 'input_field.dart';
import 'password_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _verificationCodeController =
      TextEditingController();
  bool _isLogin = true;
  bool _agreedToPrivacyPolicy = false;
  bool _obscurePassword = true;

  void _toggleForm() {
    setState(() {
      _isLogin = !_isLogin;
      // 如果切换到注册状态，先设置高度再构建界面
      if (!_isLogin) {
        _height = 580;
      } else {
        // 切换回登录状态，直接设置高度
        _height = 500;
      }
    });
  }

  double _height = 500;

  void _submit() {
    if (_isLogin) {
      // 处理登录逻辑
      print('Email: ${_emailController.text}');
      print('Password: ${_passwordController.text}');
      print('Verification Code: ${_verificationCodeController.text}');
    } else {
      // 处理注册逻辑
      if (_passwordController.text == _confirmPasswordController.text) {
        print('Email: ${_emailController.text}');
        print('Password: ${_passwordController.text}');
      } else {
        print('Passwords do not match.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('./images/login-bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            padding: const EdgeInsets.all(16),
            width: 350,
            height: _height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(0.3),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 8,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _isLogin ? context.tr('login') : context.tr('register'),
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                    ),
                  ),
                  const SizedBox(height: 25),
                  if (!_isLogin)
                    Text(
                      context.tr('registerDesc'),
                      style: TextStyle(color: Colors.grey[600]),
                      textAlign: TextAlign.center,
                    ),
                  const SizedBox(height: 20),
                  // 通用输入框样式
                  InputField(
                    controller: _emailController,
                    labelText: context.tr('email'),
                  ),
                  const SizedBox(height: 15),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: _isLogin ? 50 : 60,
                    child: PasswordInputField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      labelText: context.tr('password'),
                      onToggle: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  if (!_isLogin) const SizedBox(height: 15),
                  if (!_isLogin)
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 60,
                      child: PasswordInputField(
                        controller: _confirmPasswordController,
                        obscureText: _obscurePassword,
                        labelText: context.tr('confirmPassword'),
                        onToggle: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                  const SizedBox(height: 15),
                  // 验证码输入框独特样式
                  InputField(
                    controller: _verificationCodeController,
                    labelText: context.tr("verificationCode"),
                    isVerificationCodeField: true,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: _agreedToPrivacyPolicy,
                        onChanged: (value) {
                          setState(() {
                            _agreedToPrivacyPolicy = value!;
                          });
                        },
                        checkColor: Colors.white,
                        activeColor: Theme.of(context).primaryColor,
                      ),
                      Text(
                        context.tr("agreePolicy"),
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  CustomButton(
                    onPressed: _submit,
                    width: 200,
                    height: 45,
                    borderRadius: 12,
                    text:
                        _isLogin ? context.tr("login") : context.tr("register"),
                    textStyle:
                        const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  const SizedBox(height: 15),
                  CustomButton(
                    onPressed: _toggleForm,
                    width: 150,
                    isDisabled: _agreedToPrivacyPolicy,
                    borderRadius: 12,
                    backgroundColor: Colors.transparent,
                    text: _isLogin
                        ? context.tr("goToLogin")
                        : context.tr("goToRegistration"),
                    type: ButtonType.text,
                    textStyle: TextStyle(
                        fontSize: 14, color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
