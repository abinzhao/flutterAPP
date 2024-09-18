import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../modules/change_notifier.dart';
import './theme.dart';


Map<String, String> appThemeTypes = {
  'light': 'light',
  'dark': 'dark',
};
class ThemeUtils {
  static const String themeKey = 'current_theme';

  static Future<String?> getCurrentTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String themeName = prefs.getString(themeKey) ?? 'light';

    if (themeName == 'light') {
      return appThemeTypes['light'];
    } else {
      return appThemeTypes['dark'];
    }
  }

  static Future<void> setCurrentTheme(
      String themeName, BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(themeKey, themeName);
    context.read<Counter>().onChangeThemeValue(themeName);
  }

  static Future<void> toggleTheme(BuildContext context) async {
    dynamic currentTheme = await getCurrentTheme();
    if (!context.mounted) {
      return;
    }
    if (currentTheme == appThemeTypes['light']) {
      await setCurrentTheme('dark', context);
    } else {
      await setCurrentTheme('light', context);
    }
  }
}
