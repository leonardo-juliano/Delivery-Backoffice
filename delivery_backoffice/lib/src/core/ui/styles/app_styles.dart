import 'package:flutter/material.dart';

import 'colors_app.dart';
import 'text_styles.dart';

class AppStyles {
  static AppStyles? _instance;
  // Avoid self instance
  AppStyles._();
  static AppStyles get instance =>
    _instance ??= AppStyles._();

  ButtonStyle get primaryButton => ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(7),
    ),
    backgroundColor: ColorsApp.instance.primary,
    textStyle: TextStyles.instance.textButtonLabel,
  );
}

extension AppStylesExtension on BuildContext {
  AppStyles get appStyles => AppStyles.instance;
}