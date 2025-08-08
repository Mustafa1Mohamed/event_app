import 'package:bot_toast/bot_toast.dart';
import 'package:event_app/core/routes/page_routes_name.dart';
import 'package:event_app/modules/setting_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import 'core/routes/app_route.dart';
import 'core/services/loading_service.dart';
import 'core/theme/app_theme_manager.dart';
import 'firebase_options.dart';
import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final settingProvider = SettingProvider();
  await settingProvider.loadSettings();
  runApp(
    ChangeNotifierProvider(
      create: (context) => settingProvider,
      child: const MyApp(),
    ),
  );
  configLoading();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final settings = Provider.of<SettingProvider>(context);
    var provider = Provider.of<SettingProvider>(context);
    return MaterialApp(
      themeMode: provider.currentTheme,
      theme: AppThemeManager.lightTheme,
      darkTheme: AppThemeManager.darkTheme,
      initialRoute: PageRoutesName.initial,
      onGenerateRoute: AppRoute.onGenerateRoute,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.currentLanguage),
      builder: EasyLoading.init(builder: BotToastInit()),
    );
  }
}
