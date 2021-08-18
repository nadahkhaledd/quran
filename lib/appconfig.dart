import 'package:flutter/material.dart';

class appConfig extends ChangeNotifier {
  appConfig(){}
  ThemeMode themeMode = ThemeMode.dark;
  String currentLanguage = 'en';
  void toggleTheme() {
    if (themeMode == ThemeMode.light)
      themeMode = ThemeMode.dark;
    else
      themeMode = ThemeMode.light;
    notifyListeners();
  }

  bool isDarkMode() {
    return themeMode == ThemeMode.dark;
  }

  void changeLanguage(String language) {
    if (currentLanguage == language) return;
    currentLanguage = language;
    notifyListeners();
  }
}
