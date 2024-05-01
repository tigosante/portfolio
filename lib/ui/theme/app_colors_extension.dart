import 'package:flutter/material.dart' show MaterialColor, ThemeExtension;
import 'package:portfolio/ui/ui.dart' show AppColors;

class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  AppColorsExtension({
    required this.appColors,
  });

  final AppColors appColors;

  MaterialColor get primary => appColors.primary;
  MaterialColor get secondary => appColors.secondary;
  MaterialColor get background => appColors.background;
  MaterialColor get surface => appColors.surface;
  MaterialColor get error => appColors.error;
  MaterialColor get onPrimary => appColors.onPrimary;
  MaterialColor get onSecondary => appColors.onSecondary;
  MaterialColor get onBackground => appColors.onBackground;
  MaterialColor get onSurface => appColors.onSurface;

  @override
  ThemeExtension<AppColorsExtension> copyWith() {
    return this;
  }

  @override
  ThemeExtension<AppColorsExtension> lerp(
    covariant ThemeExtension<AppColorsExtension>? other,
    double t,
  ) {
    return this;
  }
}
