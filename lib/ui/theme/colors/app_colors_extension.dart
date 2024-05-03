import 'package:flutter/material.dart' show MaterialColor, ThemeExtension;
import 'package:portfolio/ui/ui.dart' show AppColors;

class AppColorsExtension extends ThemeExtension<AppColorsExtension>
    implements AppColors {
  AppColorsExtension({
    required this.appColors,
  });

  final AppColors appColors;

  @override
  MaterialColor get red => appColors.red;

  @override
  MaterialColor get white => appColors.white;

  @override
  MaterialColor get black => appColors.black;

  @override
  MaterialColor get lighterGray => appColors.lighterGray;

  @override
  MaterialColor get transparent => appColors.transparent;

  @override
  MaterialColor get error => red;

  @override
  MaterialColor get primary => appColors.primary;

  @override
  MaterialColor get onPrimary => appColors.onPrimary;

  @override
  MaterialColor get primaryInverse => appColors.primaryInverse;

  @override
  MaterialColor get secondary => appColors.secondary;

  @override
  MaterialColor get onSecondary => appColors.onSecondary;

  @override
  MaterialColor get secondaryInverse => appColors.secondaryInverse;

  @override
  MaterialColor get surface => appColors.surface;

  @override
  MaterialColor get onSurface => appColors.onSurface;

  @override
  MaterialColor get surfaceInverse => appColors.surfaceInverse;

  @override
  MaterialColor get background => appColors.background;

  @override
  MaterialColor get onBackground => appColors.onBackground;

  @override
  MaterialColor get backgroundInverse => appColors.backgroundInverse;

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
