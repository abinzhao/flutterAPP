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
    double inputWidth = screenWidth * 0.8;

    return SizedBox(
      width: inputWidth,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white60,
          borderRadius: widget.borderRadius ?? BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 12,
              offset: const Offset(5, 5),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: widget.borderRadius ?? BorderRadius.circular(24),
                child: TextField(
                  controller: widget.textEditingController,
                  onChanged: widget.onChanged,
                  decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    hintText: widget.hintText,
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.black.withOpacity(0.2),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 10,
                        top: 10,
                      ),
                      child: widget.rightWidget,
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 10,
                        top: 10,
                      ),
                      child: widget.leftWidget,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 12,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
