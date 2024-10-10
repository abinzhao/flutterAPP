import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// 按钮类型枚举
enum ButtonType {
  circular,
  primary,
  border,
  text,
}

// 定义 icon 位置的枚举
enum IconPosition {
  left,
  right,
}

class Button extends StatefulWidget {
  final double? width;
  final double? height;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final Widget? icon;
  final Widget? loadingIcon;
  final IconPosition? iconPosition;
  final String? buttonText;
  final TextStyle? textStyle;
  final bool isLoading;
  final VoidCallback? onPressed;
  final ButtonType type;
  final bool? disabled;
  final bool? isBoxShadow;
  final bool? isBorder;
  final BoxBorder? border;

  const Button({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.padding,
    this.backgroundColor,
    this.icon,
    this.loadingIcon,
    this.iconPosition,
    this.buttonText,
    this.textStyle,
    this.isLoading = false,
    this.onPressed,
    this.type = ButtonType.primary,
    this.disabled = false,
    this.isBoxShadow = false,
    this.isBorder = false,
    this.border,
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> with SingleTickerProviderStateMixin {
  late Widget _currentIcon;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.95).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handlePressed() {
    if (widget.onPressed != null && !widget.isLoading && !widget.disabled!) {
      _animationController.forward();
      widget.onPressed!();
      Future.delayed(const Duration(milliseconds: 150)).then((_) {
        _animationController.reverse();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    Color mainColor;
    switch (widget.type) {
      case ButtonType.circular:
      case ButtonType.primary:
        mainColor = widget.backgroundColor ?? theme.primaryColor;
        break;
      case ButtonType.border:
        mainColor = widget.backgroundColor ?? theme.primaryColor;
        break;
      case ButtonType.text:
        mainColor = Colors.transparent;
        break;
    }

    final Widget buttonContent;
    final Widget iconWidget = (widget.isLoading
        ? widget.loadingIcon ?? const CircularProgressIndicator()
        : widget.icon ?? const SizedBox.shrink());
    if (widget.buttonText == null) {
      buttonContent = iconWidget;
    } else {
      if (widget.iconPosition == IconPosition.left) {
        if (widget.type == ButtonType.circular) {
          double iconWidth = (widget.width ?? 48) * 0.5;
          _currentIcon = SizedBox(
            width: iconWidth,
            child: iconWidget,
          );
        }
        buttonContent = Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            iconWidget,
            const SizedBox(width: 8),
            Text(
              widget.buttonText!,
              style: widget.textStyle,
            ),
          ],
        );
      } else {
        if (widget.type == ButtonType.circular) {
          double iconWidth = (widget.width ?? 48) * 0.5;
          _currentIcon = SizedBox(
            width: iconWidth,
            child: iconWidget,
          );
        }
        buttonContent = Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.buttonText!,
              style: widget.textStyle,
            ),
            const SizedBox(width: 8),
            iconWidget,
          ],
        );
      }
    }

    double? width =
        widget.width ?? (widget.type == ButtonType.circular ? 48 : null);
    double? height =
        widget.height ?? (widget.type == ButtonType.circular ? width : 48);
    final bool isDisabled = widget.disabled!;
    final Color disabledColor = isDisabled ? Colors.grey : mainColor;
    final List<BoxShadow>? boxShadow = widget.isBoxShadow!
        ? [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 15,
              offset: const Offset(2, 2),
            ),
          ]
        : null;
    final BoxBorder? border = widget.isBorder!
        ? widget.border != null
            ? widget.border!
            : Border.all(
                color: disabledColor,
                width: 2,
              )
        : null;

    BoxDecoration decoration;
    switch (widget.type) {
      case ButtonType.circular:
        decoration = BoxDecoration(
          color: disabledColor,
          shape: widget.borderRadius != null
              ? BoxShape.rectangle
              : BoxShape.circle,
          borderRadius: widget.borderRadius != null
              ? BorderRadius.circular(widget.borderRadius!)
              : null,
          border: border,
          boxShadow: boxShadow,
        );
        break;
      case ButtonType.primary:
        decoration = BoxDecoration(
          color: disabledColor,
          border: border,
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
          boxShadow: boxShadow,
        );
        break;
      case ButtonType.border:
        decoration = BoxDecoration(
          border: border,
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
          boxShadow: boxShadow,
        );
        break;
      case ButtonType.text:
        decoration = const BoxDecoration();
        break;
    }

    return InkWell(
      onTap: isDisabled ? null : _handlePressed,
      borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget? child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              width: width,
              height: height,
              decoration: decoration,
              padding: widget.padding ??
                  (widget.type == ButtonType.circular
                      ? EdgeInsets.zero
                      : const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [buttonContent],
              ),
            ),
          );
        },
      ),
    );
  }
}
