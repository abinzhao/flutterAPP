import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LargeScreenFooter extends StatelessWidget {
  const LargeScreenFooter({super.key});

  Size get preferredSize => const Size.fromHeight(72.0);

  TextStyle get textStyle => const TextStyle(fontSize: 12);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: preferredSize.height,
      width: double.infinity,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                context.tr('footerText1'),
                style: textStyle,
              ),
              Text(
                context.tr('footerText2'),
                style: textStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
