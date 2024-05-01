import 'package:flutter/material.dart' show ColorScheme, TextTheme, ThemeData;
import 'package:portfolio/theme/app_colors_extension.dart'
    show AppColorsExtension;
import 'package:portfolio/theme/app_text_theme.dart' show AppTextTheme;

class AppTheme {
  static bool get _useMaterial3 => true;
  static TextTheme get _textTheme => AppTextTheme();
  static AppColorsExtension get _appColor => AppColorsExtension();

  static ThemeData get light => ThemeData(
        textTheme: _textTheme,
        extensions: [_appColor],
        useMaterial3: _useMaterial3,
        colorScheme: ColorScheme.light(
          error: _appColor.error,
          surface: _appColor.surface,
          primary: _appColor.primary,
          secondary: _appColor.secondary,
          background: _appColor.background,
          onPrimary: _appColor.onPrimary,
          onSecondary: _appColor.onSecondary,
          onBackground: _appColor.onBackground,
        ),
      );

  static ThemeData get dark =>
      ThemeData.dark(useMaterial3: _useMaterial3).copyWith(
        textTheme: _textTheme,
        extensions: [_appColor],
        colorScheme: ColorScheme.dark(
          error: _appColor.error,
          surface: _appColor.surface,
          primary: _appColor.primary,
          secondary: _appColor.secondary,
        ),
      );
}
