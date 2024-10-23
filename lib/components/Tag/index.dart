import 'package:flutter/material.dart';

enum TagColorType {
  success,
  processing,
  error,
  defaultColor,
  warning,
}

class Tag extends StatelessWidget {
  final String content;
  final TextStyle? contentStyle;
  final VoidCallback? onTap;
  final IconData? icon;
  final double? iconSize;
  final bool hasBorder;
  final TagColorType colorType;

  const Tag({
    super.key,
    required this.content,
    this.contentStyle,
    this.onTap,
    this.icon,
    this.hasBorder = false,
    this.colorType = TagColorType.defaultColor,
    this.iconSize = 12,
  });

  Color _getBackgroundColor() {
    switch (colorType) {
      case TagColorType.success:
        return const Color.fromRGBO(246, 255, 237, 1);
      case TagColorType.processing:
        return const Color.fromRGBO(230, 244, 255, 1);
      case TagColorType.error:
        return const Color.fromRGBO(255, 242, 240, 1);
      case TagColorType.warning:
        return const Color.fromRGBO(255, 251, 230, 1);
      case TagColorType.defaultColor:
      default:
        return Colors.grey;
    }
  }

  Color _getTextColor() {
    switch (colorType) {
      case TagColorType.success:
        return const Color.fromRGBO(82, 196, 26, 1);
      case TagColorType.processing:
        return const Color.fromRGBO(22, 119, 255, 1);
      case TagColorType.error:
        return const Color.fromRGBO(255, 77, 79, 1);
      case TagColorType.warning:
        return const Color.fromRGBO(250, 173, 20, 1);
      case TagColorType.defaultColor:
      default:
        return contentStyle?.color ?? Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: _getBackgroundColor(),
          borderRadius: BorderRadius.circular(5),
          border: hasBorder
              ? Border.all(
                  color: _getTextColor(),
                  width: 1,
                )
              : null,
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (icon != null)
                Icon(
                  icon,
                  color: _getTextColor(),
                  size: iconSize,
                ),
              if (icon != null) const SizedBox(width: 2),
              Text(
                content,
                style: contentStyle ??
                    TextStyle(
                      color: _getTextColor(),
                      fontSize: 12,
                      height: 1.2,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
