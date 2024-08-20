import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './theme.dart';

class ThemeUtils {
  static const String themeKey = 'current_theme';

  static Future<ThemeData> getCurrentTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String themeName = prefs.getString(themeKey) ?? 'light';

    if (themeName == 'light') {
      return AppTheme.lightTheme;
    } else {
      return AppTheme.darkTheme;
    }
  }

  static Future<void> setCurrentTheme(String themeName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(themeKey, themeName);
  }

  static Future<void> toggleTheme() async {
    ThemeData currentTheme = await getCurrentTheme();
    if (currentTheme == AppTheme.lightTheme) {
      await setCurrentTheme('dark');
    } else {
      await setCurrentTheme('light');
    }
  }
}
