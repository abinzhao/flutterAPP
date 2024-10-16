import 'package:flutter/material.dart';

class PageLayout extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget child;
  final Widget? bottomNavigationBar;
  final EdgeInsetsGeometry? padding;
  final BoxDecoration? backgroundDecoration;

  const PageLayout({
    super.key,
    this.appBar,
    required this.child,
    this.bottomNavigationBar,
    this.padding,
    this.backgroundDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgroundDecoration,
      child: Scaffold(
        appBar: appBar,
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: padding ?? EdgeInsets.zero,
          child: child,
        ),
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
