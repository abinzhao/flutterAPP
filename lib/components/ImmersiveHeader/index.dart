import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../modules/change_notifier.dart';

class ImmersiveHeader extends StatelessWidget {
  final Widget child;
  const ImmersiveHeader({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final String themeValue = context.watch<Counter>().themeValue;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            themeValue == 'light' ? Brightness.light : Brightness.dark,
      ),
      child: SafeArea(child: child),
    );
  }
}
