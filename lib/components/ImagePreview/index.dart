import 'package:flutter/material.dart';

class ImagePreview extends StatelessWidget {
  final String? imageUrl;
  final String? localImagePath;
  final double? width;
  final double? height;
  final BoxShape? boxShape;
  final double? borderRadius;
  final VoidCallback? onTap;
  final Widget? errorWidget;
  final BoxDecoration? hoverDecoration;

  const ImagePreview({
    super.key,
    this.imageUrl,
    this.localImagePath,
    this.width,
    this.height,
    this.boxShape,
    this.borderRadius,
    this.onTap,
    this.errorWidget,
    this.hoverDecoration,
  });

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (imageUrl != null) {
      // 不再直接使用 Image.network，而是使用 Container 和 ClipOval 来实现圆形效果
      child = Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: boxShape ?? BoxShape.rectangle,
          borderRadius: borderRadius != null
              ? BorderRadius.circular(borderRadius!)
              : null,
          image: DecorationImage(
            image: NetworkImage(imageUrl!),
            fit: BoxFit.cover,
          ),
        ),
      );
    } else if (localImagePath != null) {
      child = Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: boxShape ?? BoxShape.rectangle,
          borderRadius: borderRadius != null
              ? BorderRadius.circular(borderRadius!)
              : null,
          image: DecorationImage(
            image: AssetImage(localImagePath!),
            fit: BoxFit.cover,
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }

    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: onTap != null
            ? AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: onTap != null ? hoverDecoration : null,
                child: child,
              )
            : child,
      ),
    );
  }
}
