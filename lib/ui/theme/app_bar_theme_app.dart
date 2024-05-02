import 'package:flutter/material.dart'
    show
        AppBarTheme,
        BorderRadius,
        Radius,
        RoundedRectangleBorder,
        kToolbarHeight;
import 'package:portfolio/ui/ui.dart' show AppColors, AppDimensions;

class AppBarThemeApp extends AppBarTheme {
  AppBarThemeApp({
    required AppColors appColors,
    required AppDimensions appDimensions,
  }) : super(
          elevation: 0,
          centerTitle: true,
          toolbarHeight: kToolbarHeight * 2,
          backgroundColor: appColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(appDimensions.borderRadiusMedium),
            ),
          ),
        );
}
