import 'package:flutter/material.dart'
    show FontStyle, FontWeight, TextStyle, TextTheme, ThemeExtension;

class AppTextTheme extends TextTheme {
  String get _primaryFontFamily => 'SFUIText';

  @override
  TextStyle get displayLarge => TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        fontFamily: _primaryFontFamily,
      );

  @override
  TextStyle get displayMedium => TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: _primaryFontFamily,
      );

  @override
  TextStyle get displaySmall => TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontFamily: _primaryFontFamily,
      );

  @override
  TextStyle get headlineMedium => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: _primaryFontFamily,
      );

  @override
  TextStyle get headlineSmall => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        fontFamily: _primaryFontFamily,
      );

  @override
  TextStyle get titleLarge => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        fontFamily: _primaryFontFamily,
      );

  @override
  TextStyle get titleMedium => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        fontFamily: _primaryFontFamily,
      );

  @override
  TextStyle get titleSmall => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        fontFamily: _primaryFontFamily,
      );

  @override
  TextStyle get bodyLarge => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        fontFamily: _primaryFontFamily,
      );

  @override
  TextStyle get bodyMedium => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        fontFamily: _primaryFontFamily,
      );

  @override
  TextStyle get bodySmall => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        fontFamily: _primaryFontFamily,
      );

  @override
  TextStyle get labelLarge => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        fontFamily: _primaryFontFamily,
      );

  @override
  TextStyle get labelSmall => TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.normal,
        fontFamily: _primaryFontFamily,
      );
}

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
