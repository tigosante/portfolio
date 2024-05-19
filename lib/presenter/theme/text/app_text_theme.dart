import 'package:flutter/material.dart' show Brightness, FontWeight, MaterialColor, TextStyle, TextTheme;
import 'package:portfolio/presenter/theme/theme.dart' show AppColors;

class AppTextTheme extends TextTheme {
  const AppTextTheme({
    required this.colors,
    required this.brightness,
  });

  final AppColors colors;
  final Brightness brightness;

  String get primaryFontFamily => 'SF Pro Display';

  MaterialColor get textColor => colors.onSurface;

  @override
  TextStyle get displayLarge => TextStyle(
        fontSize: 48,
        color: textColor,
        height: 1.0834933333,
        letterSpacing: -0.048,
        fontWeight: FontWeight.w600,
        fontFamily: primaryFontFamily,
      );

  @override
  TextStyle get displayMedium => TextStyle(
        fontSize: 44,
        color: textColor,
        height: 1.0834933333,
        letterSpacing: -0.048,
        fontWeight: FontWeight.w600,
        fontFamily: primaryFontFamily,
      );

  @override
  TextStyle get displaySmall => TextStyle(
        fontSize: 40,
        color: textColor,
        height: 1.0834933333,
        letterSpacing: -0.048,
        fontWeight: FontWeight.w600,
        fontFamily: primaryFontFamily,
      );

  @override
  TextStyle get headlineMedium => TextStyle(
        fontSize: 36,
        color: textColor,
        fontWeight: FontWeight.bold,
        fontFamily: primaryFontFamily,
      );

  @override
  TextStyle get headlineSmall => TextStyle(
        fontSize: 32,
        color: textColor,
        fontWeight: FontWeight.bold,
        fontFamily: primaryFontFamily,
      );

  @override
  TextStyle get titleLarge => TextStyle(
        fontSize: 28,
        color: textColor,
        fontWeight: FontWeight.bold,
        fontFamily: primaryFontFamily,
      );

  @override
  TextStyle get titleMedium => TextStyle(
        fontSize: 22,
        color: textColor,
        fontWeight: FontWeight.normal,
        fontFamily: primaryFontFamily,
      );

  @override
  TextStyle get titleSmall => TextStyle(
        fontSize: 18,
        color: textColor,
        fontWeight: FontWeight.normal,
        fontFamily: primaryFontFamily,
      );

  @override
  TextStyle get bodyLarge => TextStyle(
        fontSize: 14,
        color: textColor,
        fontWeight: FontWeight.normal,
        fontFamily: primaryFontFamily,
      );

  @override
  TextStyle get bodyMedium => TextStyle(
        fontSize: 12,
        color: textColor,
        fontWeight: FontWeight.normal,
        fontFamily: primaryFontFamily,
      );

  @override
  TextStyle get bodySmall => TextStyle(
        fontSize: 10,
        color: textColor,
        fontWeight: FontWeight.normal,
        fontFamily: primaryFontFamily,
      );

  @override
  TextStyle get labelLarge => TextStyle(
        fontSize: 14,
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
