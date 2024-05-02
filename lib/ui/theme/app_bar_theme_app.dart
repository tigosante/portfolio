import 'package:flutter/material.dart' show AppBarTheme;
import 'package:portfolio/ui/ui.dart' show AppColors, AppDimensions;

class AppBarThemeApp extends AppBarTheme {
  AppBarThemeApp({
    required AppColors appColors,
    required AppDimensions appDimensions,
  }) : super(
          elevation: 0,
          centerTitle: true,
          scrolledUnderElevation: 0,
          shadowColor: appColors.transparent,
          foregroundColor: appColors.transparent,
          backgroundColor: appColors.transparent,
          surfaceTintColor: appColors.transparent,
        );
}
