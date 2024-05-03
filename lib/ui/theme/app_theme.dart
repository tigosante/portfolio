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
  AppTheme({
    required this.appType,
    required this.appColorsLight,
    required this.appColorsDark,
  });

  final AppType appType;
  final AppColors appColorsLight;
  final AppColors appColorsDark;

  ThemeData get light {
    const brightness = Brightness.light;
    final textTheme = getTexTheme(brightness);
    final appDimensions = AppDimensions(appType: appType);
    return ThemeData(
      useMaterial3: true,
      textTheme: textTheme,
      appBarTheme: AppBarThemeApp(
        appColors: appColorsLight,
        appDimensions: appDimensions,
      ),
      extensions: [
        AppTextThemeExtension(textTheme: textTheme),
        AppColorsExtension(appColors: appColorsLight),
        AppDimensionsExtension(appDimensions: appDimensions),
      ],
      colorScheme: ColorScheme.light(
        error: appColorsLight.error,
        surface: appColorsLight.surface,
        primary: appColorsLight.primary,
        secondary: appColorsLight.secondary,
        background: appColorsLight.background,
        onSecondary: appColorsLight.onSecondary,
        onBackground: appColorsLight.onBackground,
      ),
    );
  }

  ThemeData get dark {
    const brightness = Brightness.dark;
    final textTheme = getTexTheme(brightness);
    final appDimensions = AppDimensions(appType: appType);
    return ThemeData.dark(useMaterial3: true).copyWith(
      textTheme: textTheme,
      appBarTheme: AppBarThemeApp(
        appColors: appColorsDark,
        appDimensions: appDimensions,
      ),
      extensions: [
        AppTextThemeExtension(textTheme: textTheme),
        AppColorsExtension(appColors: appColorsDark),
        AppDimensionsExtension(appDimensions: appDimensions),
      ],
      colorScheme: ColorScheme.dark(
        error: appColorsDark.error,
        surface: appColorsDark.surface,
        primary: appColorsDark.primary,
        secondary: appColorsDark.secondary,
        inversePrimary: appColorsDark.onBackground,
      ),
    );
  }

  TextTheme getTexTheme(Brightness brightness) {
    final appColors =
        brightness == Brightness.light ? appColorsLight : appColorsDark;
    return AppTextTheme(appColors: appColors, brightness: brightness);
  }
}
