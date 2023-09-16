import 'package:app/app/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class MoneysupApp extends StatelessWidget {
  const MoneysupApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'moneysup',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
