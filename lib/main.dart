import 'package:bot_toast/bot_toast.dart';
import 'package:event_app/core/routes/page_routes_name.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'core/routes/app_route.dart';
import 'core/services/loading_service.dart';
import 'core/theme/app_theme_manager.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  configLoading();
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
      builder: EasyLoading.init(
          builder: BotToastInit()
      ),
    );
  }
}
