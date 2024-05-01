import 'package:flutter/material.dart'
    show TextStyle, TextTheme, ThemeExtension;

class AppTextThemeExtension extends ThemeExtension<AppTextThemeExtension> {
  AppTextThemeExtension({
    required TextTheme textTheme,
  }) : _textTheme = textTheme;

  final TextTheme _textTheme;

  TextStyle get displayLarge => _textTheme.displayLarge!;
  TextStyle get displayMedium => _textTheme.displayMedium!;
  TextStyle get displaySmall => _textTheme.displaySmall!;

  TextStyle get headlineMedium => _textTheme.headlineMedium!;
  TextStyle get headlineSmall => _textTheme.headlineSmall!;

  TextStyle get titleLarge => _textTheme.titleLarge!;
  TextStyle get titleMedium => _textTheme.titleMedium!;
  TextStyle get titleSmall => _textTheme.titleSmall!;

  TextStyle get bodyLarge => _textTheme.bodyLarge!;
  TextStyle get bodyMedium => _textTheme.bodyMedium!;
  TextStyle get bodySmall => _textTheme.bodySmall!;

  TextStyle get labelLarge => _textTheme.labelLarge!;
  TextStyle get labelSmall => _textTheme.labelSmall!;

  @override
  ThemeExtension<AppTextThemeExtension> copyWith() {
    return this;
  }

  @override
  ThemeExtension<AppTextThemeExtension> lerp(
      covariant ThemeExtension<AppTextThemeExtension>? other, double t) {
    return this;
  }
}
