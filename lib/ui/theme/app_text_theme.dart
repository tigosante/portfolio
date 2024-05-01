import 'package:flutter/material.dart'
    show Brightness, FontWeight, MaterialColor, TextStyle, TextTheme;
import 'package:portfolio/ui/theme/theme.dart' show AppColors;

class AppTextTheme extends TextTheme {
  const AppTextTheme({
    required this.appColors,
    required this.brightness,
  });

  final AppColors appColors;
  final Brightness brightness;

  String get primaryFontFamily => 'SFUIText';

  MaterialColor get textColor {
    return switch (brightness) {
      Brightness.light => appColors.onSurface,
      Brightness.dark => appColors.surface,
    };
  }

  @override
  TextStyle get displayLarge => TextStyle(
        fontSize: 24,
        color: textColor,
        fontWeight: FontWeight.bold,
        fontFamily: primaryFontFamily,
      );

  @override
  TextStyle get displayMedium => TextStyle(
        fontSize: 20,
        color: textColor,
        fontWeight: FontWeight.bold,
        fontFamily: primaryFontFamily,
      );

  @override
  TextStyle get displaySmall => TextStyle(
        fontSize: 18,
        color: textColor,
        fontWeight: FontWeight.bold,
        fontFamily: primaryFontFamily,
      );

  @override
  TextStyle get headlineMedium => TextStyle(
        fontSize: 16,
        color: textColor,
        fontWeight: FontWeight.bold,
        fontFamily: primaryFontFamily,
      );

  @override
  TextStyle get headlineSmall => TextStyle(
        fontSize: 14,
        color: textColor,
        fontWeight: FontWeight.bold,
        fontFamily: primaryFontFamily,
      );

  @override
  TextStyle get titleLarge => TextStyle(
        fontSize: 12,
        color: textColor,
        fontWeight: FontWeight.bold,
        fontFamily: primaryFontFamily,
      );

  @override
  TextStyle get titleMedium => TextStyle(
        fontSize: 16,
        color: textColor,
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
        fontSize: 16,
        color: textColor,
        fontWeight: FontWeight.normal,
        fontFamily: primaryFontFamily,
      );

  @override
  TextStyle get bodyMedium => TextStyle(
        fontSize: 14,
        color: textColor,
        fontWeight: FontWeight.normal,
        fontFamily: primaryFontFamily,
      );

  @override
  TextStyle get bodySmall => TextStyle(
        fontSize: 12,
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
