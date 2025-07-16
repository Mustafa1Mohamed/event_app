import 'package:flutter/material.dart';

import 'color_palette.dart';

abstract class AppThemeManager {
  static ThemeData lightTheme = ThemeData(
    primaryColor: ColorPalette.primaryColor,
    scaffoldBackgroundColor: Colors.white,
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: ColorPalette.primaryColor,
  );
}
