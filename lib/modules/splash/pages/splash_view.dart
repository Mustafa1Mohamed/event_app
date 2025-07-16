import 'package:event_app/core/constants/app_assets.dart';
import 'package:flutter/material.dart';

import '../../../core/routes/page_routes_name.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, PageRoutesName.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset(AppAssets.logo, height: 186)),
    );
  }
}
