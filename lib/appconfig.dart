import 'package:flutter/material.dart';

class appConfig extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  void toggleTheme() {
    if (themeMode == ThemeMode.light)
      themeMode = ThemeMode.dark;
    else
      themeMode = ThemeMode.light;
    notifyListeners() ;
  }
  bool isDarkMode()
  {
    return themeMode==ThemeMode.dark;
  }
}
