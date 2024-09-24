import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final bool? isVerificationCodeField;

  const InputField({
    super.key,
    required this.controller,
    required this.labelText,
    this.isVerificationCodeField,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _isSendingCode = false;
  int _countdownSeconds = 60;

  void _sendVerificationCode() async {
    setState(() {
      _isSendingCode = true;
    });

    // 模拟发送验证码的异步操作
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _countdownSeconds = 60;
      // 开启倒计时
      _startCountdown();
    });
  }

  void _startCountdown() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdownSeconds > 0) {
        setState(() {
          _countdownSeconds--;
        });
      } else {
        timer.cancel();
        setState(() {
          _isSendingCode = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue[800]!),
          borderRadius: BorderRadius.circular(8),
        ),
        labelStyle: TextStyle(color: Colors.grey[600]),
        suffixIcon: widget.isVerificationCodeField == true
            ? _isSendingCode
                ? Container(
                    alignment: Alignment.center,
                    width: 50,
                    child: Text(
                      '$_countdownSeconds s',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  )
                : SizedBox(
                    height: 30,
                    width: 80,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
                      child: ElevatedButton(
                        onPressed:
                            _isSendingCode ? null : _sendVerificationCode,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[800],
                          padding: const EdgeInsets.all(4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          context.tr('sendCode'),
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
            : null,
      ),
    );
  }
}
