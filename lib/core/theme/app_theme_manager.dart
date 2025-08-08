import 'package:flutter/material.dart';

import 'color_palette.dart';

abstract class AppThemeManager {
  static ThemeData lightTheme = ThemeData(
    primaryColor: ColorPalette.primaryColor,
    scaffoldBackgroundColor: ColorPalette.scaffoldDarkBackground,

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorPalette.scaffoldDarkBackground,
      type: BottomNavigationBarType.fixed,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: ColorPalette.primaryColor,
  );
}
