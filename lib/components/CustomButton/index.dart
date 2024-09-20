import 'package:flutter/material.dart';

enum ButtonType { elevated, text }

class CustomButton extends StatefulWidget {
  final bool? isLoading;
  final bool? isDisabled;
  final bool? isCircular;
  final VoidCallback? onPressed;
  final Widget? icon;
  final String? text;
  final TextStyle? textStyle;
  final List<Color>? gradientColors;
  final Color? backgroundColor;
  final Color? loadingColor;
  final double? width;
  final double? height;
  final double? borderRadius;
  final EdgeInsets? padding;
  final ButtonType type;

  const CustomButton({
    super.key,
    this.isLoading = false,
    this.isDisabled = false,
    this.isCircular = false,
    this.onPressed,
    this.icon,
    this.text,
    this.gradientColors,
    this.backgroundColor = Colors.blue,
    this.width,
    this.padding,
    this.height,
    this.textStyle,
    this.loadingColor,
    this.type = ButtonType.elevated,
    this.borderRadius = 8,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _rotationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    );
    if (widget.isLoading!) {
      _animationController.repeat();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget buttonChild;
    if (widget.isLoading!) {
      buttonChild = AnimatedBuilder(
        animation: _rotationAnimation,
        builder: (context, child) {
          return Transform.rotate(
            angle: 2 * 3.1415926535897932 * _rotationAnimation.value,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  widget.loadingColor ?? Colors.white),
            ),
          );
        },
      );
    } else {
      buttonChild = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.icon != null) widget.icon!,
          if (widget.text != null) SizedBox(width: widget.icon != null ? 8 : 0),
          if (widget.text != null)
            Text(
              widget.text!,
              style: widget.textStyle ??
                  const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
            ),
        ],
      );
    }

    if (widget.type == ButtonType.elevated) {
      return SizedBox(
        width: widget.width,
        height: widget.height,
        child: ElevatedButton(
          onPressed:
              widget.isDisabled! || widget.isLoading! ? null : widget.onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: (widget.gradientColors != null
                ? LinearGradient(
                    colors: widget.gradientColors!,
                  )
                : widget.backgroundColor) as Color?,
            shape: widget.isCircular!
                ? const CircleBorder()
                : RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius!),
                  ),
            side: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          child: buttonChild,
        ),
      );
    } else {
      return SizedBox(
        width: widget.width,
        height: widget.height,
        child: TextButton(
          onPressed:
              widget.isDisabled! || widget.isLoading! ? null : widget.onPressed,
          style: TextButton.styleFrom(
            backgroundColor: (widget.gradientColors != null
                ? LinearGradient(
                    colors: widget.gradientColors!,
                  )
                : widget.backgroundColor) as Color?,
            shape: widget.isCircular!
                ? const CircleBorder()
                : RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius!),
                  ),
          ),
          child: buttonChild,
        ),
      );
    }
  }
}
