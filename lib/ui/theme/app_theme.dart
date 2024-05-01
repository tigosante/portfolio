import 'package:flutter/material.dart'
    show AppBarTheme, ColorScheme, TextTheme, ThemeData, ThemeExtension;
import 'package:portfolio/ui/ui.dart'
    show AppColorsExtension, AppTextTheme, AppTextThemeExtension;

class AppTheme {
  static bool get _useMaterial3 => true;
  static TextTheme get _textTheme => AppTextTheme();
  static AppColorsExtension get _appColor => AppColorsExtension();
  static ThemeExtension<AppTextThemeExtension> get _textThemeExtension =>
      AppTextThemeExtension(textTheme: _textTheme);

  static ThemeData get light => ThemeData(
        textTheme: _textTheme,
        useMaterial3: _useMaterial3,
        extensions: [_appColor, _textThemeExtension],
        colorScheme: ColorScheme.light(
          error: _appColor.error,
          surface: _appColor.surface,
          primary: _appColor.primary,
          secondary: _appColor.secondary,
          background: _appColor.background,
          onSecondary: _appColor.onSecondary,
          onBackground: _appColor.onBackground,
        ),
      );

  static ThemeData get dark =>
      ThemeData.dark(useMaterial3: _useMaterial3).copyWith(
        textTheme: _textTheme,
        extensions: [_appColor, _textThemeExtension],
        appBarTheme: AppBarTheme(
          backgroundColor: _appColor.onBackground,
        ),
        colorScheme: ColorScheme.dark(
          error: _appColor.error,
          surface: _appColor.surface,
          primary: _appColor.primary,
          secondary: _appColor.secondary,
          inversePrimary: _appColor.onBackground,
        ),
      );
}
