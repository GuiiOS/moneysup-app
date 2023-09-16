import 'package:app/app/screens/splash_screen.dart';
import 'package:app/app/statics/routes.dart';
import 'package:app/app/theme/config_theme.dart';
import 'package:flutter/material.dart';

class MoneysupApp extends StatelessWidget {
  const MoneysupApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'moneysup',
      theme: ThemeConfig.theme,
      routes: {
        Routes.splashScreen: (context) => const SplashScreen(),
      },
    );
  }
}
