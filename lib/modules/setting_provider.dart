import 'package:flutter/material.dart';

import '../core/utils/AppPrefreces.dart';

class SettingProvider extends ChangeNotifier {
  String currentLanguage = 'en';
  ThemeMode currentTheme = ThemeMode.light;

  void changeLanguage(String language) {
    if (language == currentLanguage) return;
    currentLanguage = language;
    AppPreferences.saveLanguage(language);
    notifyListeners();
  }

  void changeTheme(ThemeMode themeMode) {
    if (themeMode == currentTheme) return;
    currentTheme = themeMode;
    AppPreferences.saveTheme(isDarkMode());
    notifyListeners();
  }

  bool isDarkMode() => currentTheme == ThemeMode.dark;

  Future<void> loadSettings() async {
    // Load saved language
    currentLanguage = await AppPreferences.getLanguage() ?? 'en';

    // Load saved theme (bool) and map to ThemeMode
    final isDark = await AppPreferences.getTheme() ?? false;
    currentTheme = isDark ? ThemeMode.dark : ThemeMode.light;

    notifyListeners();
  }
}
