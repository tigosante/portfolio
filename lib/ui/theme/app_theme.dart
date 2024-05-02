import 'package:flutter/material.dart'
    show Brightness, ColorScheme, TextTheme, ThemeData;
import 'package:portfolio/ui/theme/app_bar_theme_app.dart';
import 'package:portfolio/ui/ui.dart'
    show
        AppColors,
        AppColorsExtension,
        AppDimensions,
        AppDimensionsExtension,
        AppTextTheme,
        AppTextThemeExtension,
        AppType;

class AppTheme {
  AppTheme({required this.appType, required this.appColors});

  final AppType appType;
  final AppColors appColors;

  ThemeData get light {
    final textTheme = getTexTheme(Brightness.light);
    final appDimensions = AppDimensions(appType: appType);
    return ThemeData(
      useMaterial3: true,
      textTheme: textTheme,
      appBarTheme: AppBarThemeApp(
        appColors: appColors,
        appDimensions: appDimensions,
      ),
      extensions: [
        AppDimensionsExtension(appDimensions: appDimensions),
        AppColorsExtension(appColors: appColors),
        AppTextThemeExtension(textTheme: textTheme),
      ],
      colorScheme: ColorScheme.light(
        error: appColors.error,
        surface: appColors.surface,
        primary: appColors.primary,
        secondary: appColors.secondary,
        background: appColors.background,
        onSecondary: appColors.onSecondary,
        onBackground: appColors.onBackground,
      ),
    );
  }

  ThemeData get dark {
    final textTheme = getTexTheme(Brightness.dark);
    final appDimensions = AppDimensions(appType: appType);
    return ThemeData.dark(useMaterial3: true).copyWith(
      textTheme: textTheme,
      appBarTheme: AppBarThemeApp(
        appColors: appColors,
        appDimensions: appDimensions,
      ),
      extensions: [
        AppDimensionsExtension(appDimensions: appDimensions),
        AppColorsExtension(appColors: appColors),
        AppTextThemeExtension(textTheme: textTheme),
      ],
      colorScheme: ColorScheme.dark(
        error: appColors.error,
        surface: appColors.surface,
        primary: appColors.primary,
        secondary: appColors.secondary,
        inversePrimary: appColors.onBackground,
      ),
    );
  }

  TextTheme getTexTheme(Brightness brightness) {
    return AppTextTheme(appColors: appColors, brightness: brightness);
  }
}
