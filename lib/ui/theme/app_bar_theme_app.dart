import 'package:flutter/material.dart' show AppBarTheme;
import 'package:portfolio/ui/ui.dart' show AppColors;

class AppBarThemeApp extends AppBarTheme {
  AppBarThemeApp({
    required AppColors appColors,
  }) : super(
          elevation: 0,
          centerTitle: true,
          scrolledUnderElevation: 0,
          shadowColor: appColors.transparent,
          foregroundColor: appColors.transparent,
          surfaceTintColor: appColors.transparent,
          backgroundColor: appColors.primary.withOpacity(0.1),
        );
}
