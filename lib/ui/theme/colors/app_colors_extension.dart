import 'package:flutter/material.dart' show MaterialColor, ThemeExtension;
import 'package:portfolio/ui/ui.dart' show AppColors;

class AppColorsExtension extends ThemeExtension<AppColorsExtension>
    implements AppColors {
  AppColorsExtension({
    required this.appColors,
  });

  final AppColors appColors;

  @override
  MaterialColor get primary => appColors.primary;

  @override
  MaterialColor get secondary => appColors.secondary;

  @override
  MaterialColor get background => appColors.background;

  @override
  MaterialColor get surface => appColors.surface;

  @override
  MaterialColor get error => appColors.error;

  @override
  MaterialColor get transparent => appColors.transparent;

  @override
  MaterialColor get onPrimary => appColors.onPrimary;

  @override
  MaterialColor get onSecondary => appColors.onSecondary;

  @override
  MaterialColor get onBackground => appColors.onBackground;

  @override
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
