import 'package:flutter/material.dart';
import 'package:preferences/shared/preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeMode = ThemeData.light();

  ThemeProvider() {
    _themeMode = Preferences.getBool('isDarkMode')
        ? ThemeData.dark()
        : ThemeData.light();
  }

  ThemeData get themeMode => _themeMode;

  setTheme(bool isDarkMode) {
    _themeMode = isDarkMode ? ThemeData.dark() : ThemeData.light();
    Preferences.setBool('isDarkMode', isDarkMode);
    notifyListeners();
  }
}
