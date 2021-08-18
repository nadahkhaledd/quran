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
  bool isEnglish() => currentLanguage == 'en';

  void changeLanguage(String language) {
    if (currentLanguage == language) return;
    currentLanguage = language;
    notifyListeners();
  }

  bool isEnglish()
  {
    return currentLanguage=='en';
  }

}
