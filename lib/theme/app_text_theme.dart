import 'package:flutter/material.dart' show FontWeight, TextStyle, TextTheme;

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
