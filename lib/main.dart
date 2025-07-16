import 'package:event_app/core/routes/page_routes_name.dart';
import 'package:flutter/material.dart';

import 'core/routes/app_route.dart';
import 'core/theme/app_theme_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemeManager.lightTheme,
      darkTheme: AppThemeManager.darkTheme,
      initialRoute: PageRoutesName.initial,
      onGenerateRoute: AppRoute.onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
