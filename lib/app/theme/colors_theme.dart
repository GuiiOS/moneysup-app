import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();

  static ColorsApp get instance {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get background => const Color(0xFF07161B);
  Color get primary => const Color(0xFF3D737F);
  Color get secondary => const Color(0xFFCEC7BF);

  Color get textWhite => const Color(0xFFFFFFFF);
  Color get textBlack => const Color(0xFF000000);
}

extension ColorsAppExtension on BuildContext {
  ColorsApp get colors => ColorsApp.instance;
}
