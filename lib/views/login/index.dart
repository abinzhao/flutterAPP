import 'dart:ui';

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
  bool _rememberMe = false;
  bool _obscurePassword = true;

  void _toggleForm() {
    setState(() {
      _isLogin = !_isLogin;
    });
  }

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
    return ImmersiveHeader(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue[400] as Color,
                Colors.blue[600] as Color,
              ],
            ),
          ),
          child: Center(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.transparent,
                ),
                child: Card(
                  color: Colors.white.withOpacity(0.7),
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Container(
                    color: Colors.transparent,
                    padding: const EdgeInsets.all(20),
                    width: 320,
                    height: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _isLogin ? 'Login' : 'Register',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[800],
                          ),
                        ),
                        const SizedBox(height: 20),
                        InputField(
                          controller: _emailController,
                          labelText: 'Email',
                        ),
                        const SizedBox(height: 10),
                        if (_isLogin)
                          PasswordInputField(
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            onToggle: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        if (!_isLogin)
                          PasswordInputField(
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            onToggle: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        if (!_isLogin) const SizedBox(height: 10),
                        if (!_isLogin)
                          PasswordInputField(
                            controller: _confirmPasswordController,
                            obscureText: _obscurePassword,
                            onToggle: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Checkbox(
                              value: _rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  _rememberMe = value!;
                                });
                              },
                              activeColor: Colors.blue[800],
                            ),
                            Text(
                              'Remember me',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                        CustomButton(
                          onPressed: _submit,
                          width: 200,
                          height: 42,
                          borderRadius: 16,
                          text: _isLogin ? 'Login' : 'Register',
                        ),
                        const SizedBox(height: 10),
                        CustomButton(
                          onPressed: _toggleForm,
                          width: 150,
                          borderRadius: 16,
                          backgroundColor: Colors.transparent,
                          text:
                              _isLogin ? 'Register instead?' : 'Login instead?',
                          type: ButtonType.text,
                          textStyle:
                              TextStyle(fontSize: 12, color: Colors.blue[800]),
                        ),

                        VerificationCodeInput(
                          codeLength: 2,
                          width: 200,
                          padding: const EdgeInsets.all(10),
                          backgroundColor: Colors.lightBlue.withOpacity(0.2),
                          borderColor: Colors.blue,
                          textColor: Colors.blue,
                          onChange: () {
                            // 验证码改变时的处理逻辑
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
