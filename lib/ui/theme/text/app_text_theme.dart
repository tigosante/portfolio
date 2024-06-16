import 'package:flutter/material.dart';

class AppTextTheme extends TextTheme {
  const AppTextTheme({
    required this.textColor,
  });

  final Color textColor;

  String get primaryFontFamily => 'SF Pro Display';

  @override
  TextStyle get displayLarge => TextStyle(
        fontSize: 64,
        color: textColor,
        height: 1.0834933333,
        letterSpacing: -0.048,
        fontWeight: FontWeight.w600,
        fontFamily: primaryFontFamily,
      );

  @override
  TextStyle get displayMedium => TextStyle(
        fontSize: 48,
        color: textColor,
        height: 1.0834933333,
        letterSpacing: -0.048,
        fontWeight: FontWeight.w600,
        fontFamily: primaryFontFamily,
      );

  @override
  TextStyle get displaySmall => TextStyle(
        fontSize: 32,
        color: textColor,
        height: 1.0834933333,
        letterSpacing: -0.048,
        fontWeight: FontWeight.w600,
        fontFamily: primaryFontFamily,
      );

  @override
  TextStyle get headlineMedium => TextStyle(
        fontSize: 24,
        color: textColor,
        fontWeight: FontWeight.bold,
        fontFamily: primaryFontFamily,
      );

  @override
  TextStyle get headlineSmall => TextStyle(
        fontSize: 20,
        color: textColor,
        fontWeight: FontWeight.bold,
        fontFamily: primaryFontFamily,
      );

  @override
  TextStyle get titleLarge => TextStyle(
        fontSize: 18,
        color: textColor,
        fontWeight: FontWeight.bold,
        fontFamily: primaryFontFamily,
      );

  @override
  TextStyle get titleMedium => TextStyle(
        fontSize: 16,
        color: textColor,
        height: 1.0909090909,
        fontWeight: FontWeight.normal,
        fontFamily: primaryFontFamily,
      );

  @override
  TextStyle get titleSmall => TextStyle(
        fontSize: 14,
        color: textColor,
        fontWeight: FontWeight.normal,
        fontFamily: primaryFontFamily,
      );

  @override
  TextStyle get bodyLarge => TextStyle(
        fontSize: 18,
        color: textColor,
        fontWeight: FontWeight.normal,
        fontFamily: primaryFontFamily,
      );

  @override
  TextStyle get bodyMedium => TextStyle(
        fontSize: 16,
        color: textColor,
        wordSpacing: 3,
        fontWeight: FontWeight.normal,
        fontFamily: primaryFontFamily,
      );

  @override
  TextStyle get bodySmall => TextStyle(
        fontSize: 14,
        color: textColor,
        fontWeight: FontWeight.normal,
        fontFamily: primaryFontFamily,
      );

  @override
  TextStyle get labelLarge => TextStyle(
        fontSize: 12,
        color: textColor,
        fontWeight: FontWeight.bold,
        fontFamily: primaryFontFamily,
      );

  @override
  TextStyle get labelSmall => TextStyle(
        fontSize: 10,
        color: textColor,
        fontWeight: FontWeight.normal,
        fontFamily: primaryFontFamily,
      );
}
