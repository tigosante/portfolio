import 'package:flutter/material.dart' show MaterialColor, ThemeExtension;
import 'package:portfolio/ui/ui.dart' show AppColors;

class AppColorsExtension extends ThemeExtension<AppColorsExtension> implements AppColors {
  AppColorsExtension({
    required this.colors,
  });

  final AppColors colors;

  @override
  MaterialColor get red => colors.red;

  @override
  MaterialColor get blue => colors.blue;

  @override
  MaterialColor get white => colors.white;

  @override
  MaterialColor get black => colors.black;

  @override
  MaterialColor get black87 => colors.black87;

  @override
  MaterialColor get darkGrey => colors.darkGrey;

  @override
  MaterialColor get lighterGrey => colors.lighterGrey;

  @override
  MaterialColor get transparent => colors.transparent;

  @override
  MaterialColor get link => colors.link;

  @override
  MaterialColor get error => colors.error;

  @override
  MaterialColor get onError => colors.onError;

  @override
  MaterialColor get primary => colors.primary;

  @override
  MaterialColor get onPrimary => colors.onPrimary;

  @override
  MaterialColor get secondary => colors.secondary;

  @override
  MaterialColor get onSecondary => colors.onSecondary;

  @override
  MaterialColor get surface => colors.surface;

  @override
  MaterialColor get onSurface => colors.onSurface;

  @override
  ThemeExtension<AppColorsExtension> copyWith() {
    return this;
  }

  @override
  ThemeExtension<AppColorsExtension> lerp(covariant ThemeExtension<AppColorsExtension>? other, double t) {
    return this;
  }
}
