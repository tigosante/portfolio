import 'package:flutter/material.dart'
    show Color, MaterialColor, ThemeExtension;

class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  MaterialColor primary = const MaterialColor(0xFF4831d4, <int, Color>{});
  MaterialColor secondary = const MaterialColor(0xFFccf381, <int, Color>{});
  MaterialColor background = const MaterialColor(0xFFFFFFFF, <int, Color>{});
  MaterialColor surface = const MaterialColor(0xFFFFFFFF, <int, Color>{});
  MaterialColor error = const MaterialColor(0xFFB00020, <int, Color>{});
  MaterialColor onPrimary = const MaterialColor(0xFFFFFFFF, <int, Color>{});
  MaterialColor onSecondary = const MaterialColor(0xFF000000, <int, Color>{});
  MaterialColor onBackground = const MaterialColor(0xFF000000, <int, Color>{});

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
