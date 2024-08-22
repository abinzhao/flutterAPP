import 'package:flutter/foundation.dart';

class Counter with ChangeNotifier, DiagnosticableTreeMixin {
  int _bottomNavBarIndex = 0;

  int get bottomNavBarIndex => _bottomNavBarIndex;

  void onChangeBottomNavBarIndex(index) {
    _bottomNavBarIndex = index;
    notifyListeners();
  }
}
