import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;
  // Avoid self instance
  ColorsApp._();
  static ColorsApp get instance => _instance ??= ColorsApp._();

  Color get primary => const Color(0XFF007D21);
  Color get secondary => const Color(0XFFFFAB18);
  Color get black => const Color(0XFF140E0E);
}

extension ColorsAppExceptions on BuildContext {
  ColorsApp get colors => ColorsApp.instance;
}
