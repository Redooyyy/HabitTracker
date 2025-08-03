import 'package:flutter/material.dart';
import 'package:hab8/theme/dark_mode.dart';
import 'package:hab8/theme/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  //by deafult light mode
  ThemeData _themeData = LightMode;

  //get current theme
  ThemeData get themeData => _themeData;

  //dark or not
  bool get isDarkMode => _themeData == DarkMode;

  //function for setting up theme/updating theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  //switching bitween themes
  void switchTheme() {
    if (_themeData == LightMode) {
      _themeData = DarkMode;
    } else {
      _themeData = LightMode;
    }
    notifyListeners();
  }
}
