import 'dart:async';

import 'package:flutter/material.dart';

enum InputType { text, password, verificationCode }

class InputField extends StatefulWidget {
  final BorderRadiusGeometry? borderRadius;
  final Widget? leftWidget;
  final Widget? rightWidget;
  final String? hintText;
  final Function(String?)? onChanged;
  final TextEditingController? textEditingController;
  final InputType? type;
  final Color? backgroundColor;
  final int? countdownSeconds;
  final VoidCallback? onSendVerificationCode;
  final double? width;

  const InputField({
    super.key,
    this.borderRadius,
    this.leftWidget,
    this.rightWidget,
    this.hintText,
    this.onChanged,
    this.textEditingController,
    this.type = InputType.text,
    this.backgroundColor = Colors.white,
    this.countdownSeconds = 60,
    this.onSendVerificationCode,
    this.width,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _obscureText = true;

  int _countdown = 0;
  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double inputWidth = screenWidth * 0.8;

    return SizedBox(
      width: widget.width ?? inputWidth,
      child: Container(
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: widget.borderRadius ?? BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 12,
              offset: const Offset(5, 5),
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(24),
          child: widget.type == InputType.verificationCode
              ? TextField(
                  controller: widget.textEditingController,
                  onChanged: widget.onChanged,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: widget.backgroundColor,
                    border: InputBorder.none,
                    hintText: widget.hintText,
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.3),
                    ),
                    suffixIcon: TextButton(
                      onPressed: _countdown <= 0
                          ? () {
                              widget.onSendVerificationCode?.call();
                              _startCountdown();
                            }
                          : null,
                      child: Text(
                        _countdown <= 0 ? '发送验证码' : '$_countdown 秒后',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 20,
                    ),
                  ),
                  textAlignVertical: TextAlignVertical.center,
                )
              : TextField(
                  controller: widget.textEditingController,
                  onChanged: widget.onChanged,
                  obscureText:
                      widget.type == InputType.password && _obscureText,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: widget.backgroundColor,
                    border: InputBorder.none,
                    hintText: widget.hintText,
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.3),
                    ),
                    suffixIcon: widget.rightWidget ??
                        (widget.type == InputType.password
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                child: Icon(
                                  _obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              )
                            : (widget.type == InputType.verificationCode
                                ? null
                                : null)),
                    prefixIcon: widget.leftWidget,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 20,
                    ),
                  ),
                  textAlignVertical: TextAlignVertical.center,
                ),
        ),
      ),
    );
  }

  void _startCountdown() {
    _countdown = widget.countdownSeconds ?? 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_countdown > 0) {
          _countdown--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
