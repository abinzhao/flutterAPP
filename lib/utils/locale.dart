import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocaleUtils {
  static Locale getLocale(BuildContext context) {
    return context.locale;
  }

  static Future<void> setLocale(BuildContext context) async {
    if (context.locale.languageCode == 'en') {
      await context.setLocale(const Locale('zh', 'CN'));
    } else {
      await context.setLocale(const Locale('en', 'US'));
    }
  }
}
