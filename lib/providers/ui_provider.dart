import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  bool _darkMode = false;

  bool get darkMode {
    return this._darkMode;
  }

  set darkMode(bool dm) {
    this._darkMode = dm;
    notifyListeners();
  }
}
