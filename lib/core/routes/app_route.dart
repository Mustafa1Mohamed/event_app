import 'package:event_app/core/routes/page_routes_name.dart';
import 'package:event_app/modules/authentication/login_auth/pages/login_view.dart';
import 'package:event_app/modules/authentication/register_auth/pages/register_view.dart';
import 'package:event_app/modules/onboarding/pages/onboarding_page_view.dart';
import 'package:flutter/material.dart';

import '../../modules/layout/layout_view.dart';
import '../../modules/onboarding/pages/onboarding_login_view.dart';
import '../../modules/onboarding/pages/onboarding_one.dart';
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
      case PageRoutesName.onboarding:
        return MaterialPageRoute(
          builder: (_) => const OnboardingLoginView(),
          settings: settings,
        );
      case PageRoutesName.onboardingOne:
        return MaterialPageRoute(
          builder: (_) => const OnboardingOne(),
          settings: settings,
        );
      case PageRoutesName.onboardingPageView:
        return MaterialPageRoute(
          builder: (_) => const OnboardingPageView(),
          settings: settings,
        );
      case PageRoutesName.register:
        return MaterialPageRoute(
          builder: (_) => const RegisterView(),
          settings: settings,
        );
      case PageRoutesName.layout:
        return MaterialPageRoute(
          builder: (_) => const LayoutView(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(builder: (_) => const SplashView());
    }
  }
}
