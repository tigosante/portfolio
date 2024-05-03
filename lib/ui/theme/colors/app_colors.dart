import 'package:flutter/material.dart' show Brightness, Color, MaterialColor;

class AppColors {
  AppColors._({required Brightness brightness}) : _brightness = brightness;

  final Brightness _brightness;

  final MaterialColor red = const MaterialColor(0xFFB00020, <int, Color>{});
  final MaterialColor white = const MaterialColor(0xFFffffff, <int, Color>{});
  final MaterialColor black = const MaterialColor(0xFF000000, <int, Color>{});
  final MaterialColor lighterGray =
      const MaterialColor(0xFFfcfcfc, <int, Color>{});

  bool get _isLight => _brightness == Brightness.light;

  MaterialColor get error => red;

  MaterialColor get primary => const MaterialColor(0xFF4831d4, <int, Color>{});
  MaterialColor get onPrimary => lighterGray;
  MaterialColor get primaryInverse => _isLight ? primary : onPrimary;

  MaterialColor get secondary =>
      const MaterialColor(0xFFccf381, <int, Color>{});
  MaterialColor get onSecondary => black;
  MaterialColor get secondaryInverse => _isLight ? secondary : onSecondary;

  MaterialColor get surface => lighterGray;
  MaterialColor get onSurface => black;
  MaterialColor get surfaceInverse => _isLight ? surface : onSurface;

  MaterialColor get background => lighterGray;
  MaterialColor get onBackground => black;
  MaterialColor get backgroundInverse => _isLight ? background : onBackground;

  MaterialColor get transparent =>
      const MaterialColor(0x00000000, <int, Color>{});

  factory AppColors.light() {
    return AppColors._(brightness: Brightness.light);
  }
  factory AppColors.dark() {
    return AppColors._(brightness: Brightness.dark);
  }
}
