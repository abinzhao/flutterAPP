import 'package:flutter/foundation.dart';

class Counter with ChangeNotifier, DiagnosticableTreeMixin {
  int _bottomNavBarIndex = 0;
  String _themeValue = 'light';

  int get bottomNavBarIndex => _bottomNavBarIndex;
  String get themeValue => _themeValue;

  void onChangeBottomNavBarIndex(index) {
    _bottomNavBarIndex = index;
    notifyListeners();
  }

  void onChangeThemeValue(value) {
    _themeValue = value;
    notifyListeners();
  }
}
