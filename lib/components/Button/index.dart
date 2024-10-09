import 'package:flutter/material.dart';

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
    _currentIcon = (widget.isLoading && widget.loadingIcon != null
        ? widget.loadingIcon
        : widget.icon ?? const SizedBox.shrink())!;
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
    if (widget.buttonText == null) {
      buttonContent = _currentIcon;
    } else {
      if (widget.iconPosition == IconPosition.left) {
        if (widget.type == ButtonType.circular) {
          double iconWidth = (widget.width ?? 48) * 0.5;
          _currentIcon = SizedBox(
            width: iconWidth,
            child: _currentIcon,
          );
        }
        buttonContent = Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _currentIcon,
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
            child: _currentIcon,
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
            _currentIcon,
          ],
        );
      }
    }

    double? width =
        widget.width ?? (widget.type == ButtonType.circular ? 48 : null);
    double? height =
        widget.height ?? (widget.type == ButtonType.circular ? width : 48);
    final bool isDisabled = widget.disabled! || widget.isLoading;

    BoxDecoration decoration;
    switch (widget.type) {
      case ButtonType.circular:
        decoration = BoxDecoration(
          color: isDisabled ? Colors.grey : mainColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 15,
              offset: const Offset(2, 2),
            )
          ],
        );
        break;
      case ButtonType.primary:
        decoration = BoxDecoration(
          color: isDisabled ? Colors.grey : mainColor,
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 15,
              offset: const Offset(2, 2),
            )
          ],
        );
        break;
      case ButtonType.border:
        decoration = BoxDecoration(
          border: Border.all(
            color: mainColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
        );
        break;
      case ButtonType.text:
        decoration = const BoxDecoration();
        break;
    }

    Color iconColor;
    switch (widget.type) {
      case ButtonType.border:
      case ButtonType.text:
        iconColor = mainColor;
        break;
      default:
        iconColor = Colors.white;
    }

    if (widget.icon != null) {
      _currentIcon = ColorFiltered(
        colorFilter: ColorFilter.mode(
          iconColor,
          BlendMode.srcIn,
        ),
        child: _currentIcon,
      );
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
