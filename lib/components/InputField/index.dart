import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final BorderRadiusGeometry? borderRadius;
  final Widget? leftWidget;
  final Widget? rightWidget;
  final String? hintText;
  final Function(String?)? onChanged;
  final TextEditingController? textEditingController;

  const InputField({
    super.key,
    this.borderRadius,
    this.leftWidget,
    this.rightWidget,
    this.hintText,
    this.onChanged,
    this.textEditingController,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double inputWidth = screenWidth * 0.8; // 占屏幕宽度的 80%，可根据需求调整比例

    return Container(
      width: inputWidth,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: widget.borderRadius ?? BorderRadius.circular(24),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              controller: widget.textEditingController,
              onChanged: widget.onChanged,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: const TextStyle(fontSize: 18),
                suffixIcon: widget.rightWidget,
                prefixIcon: widget.leftWidget,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
