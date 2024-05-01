import 'package:flutter/material.dart'
    show AppBarTheme, Brightness, ColorScheme, ThemeData;
import 'package:portfolio/ui/ui.dart'
    show
        AppColors,
        AppColorsExtension,
        AppDimensionsExtension,
        AppTextTheme,
        AppTextThemeExtension;

class AppTheme {
  AppTheme({required this.appColors});

  final AppColors appColors;

  ThemeData get light {
    final textTheme =
        AppTextTheme(appColors: appColors, brightness: Brightness.light);
    return ThemeData(
      textTheme: textTheme,
      useMaterial3: true,
      extensions: [
        AppDimensionsExtension(),
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
    final textTheme =
        AppTextTheme(appColors: appColors, brightness: Brightness.dark);
    return ThemeData.dark(useMaterial3: true).copyWith(
      textTheme: textTheme,
      appBarTheme: AppBarTheme(backgroundColor: appColors.onBackground),
      extensions: [
        AppDimensionsExtension(),
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
}
