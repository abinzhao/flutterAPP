import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerificationCodeInput extends StatefulWidget {
  final int? codeLength;
  final double? width;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final VoidCallback? onChange;
  final bool? isError;

  const VerificationCodeInput({
    super.key,
    this.codeLength,
    this.width,
    this.padding,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.onChange,
    this.isError,
  });

  @override
  State<VerificationCodeInput> createState() => _VerificationCodeInputState();
}

class _VerificationCodeInputState extends State<VerificationCodeInput> {
  late List<String> _code;

  @override
  void initState() {
    super.initState();
    _code = List.filled(widget.codeLength ?? 4, '');
  }

  void _onCodeChange(int index, String value) {
    setState(() {
      _code[index] = value;
      if (widget.onChange != null) {
        widget.onChange!();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final itemWidth = widget.width ?? 200 / (widget.codeLength ?? 4);
    final spacing = itemWidth / (widget.codeLength ?? 4);

    return Container(
      width: widget.width,
      padding: widget.padding,
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Colors.white,
        border: Border.all(
          color: widget.isError ?? false
              ? Colors.red
              : widget.borderColor ?? Colors.grey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          widget.codeLength ?? 4,
          (index) => SizedBox(
            width: itemWidth - spacing,
            child: TextField(
              onChanged: (value) => _onCodeChange(index, value),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: widget.textColor ?? Colors.black,
                fontSize: 16.0,
              ),
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
