import 'package:event_app/core/routes/page_routes_name.dart';
import 'package:event_app/modules/authentication/pages/login_view.dart';
import 'package:flutter/material.dart';

import '../../modules/splash/pages/splash_view.dart';

abstract class AppRoute {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRoutesName.initial:
        return MaterialPageRoute(
          builder: (_) => const SplashView(),
          settings: settings,
        );
      case PageRoutesName.login:
        return MaterialPageRoute(
          builder: (_) => const LoginView(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(builder: (_) => const SplashView());
    }
  }
}
