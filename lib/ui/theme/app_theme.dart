import 'package:flutter/material.dart' show Brightness, ColorScheme, ThemeData;
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
  AppTheme({required this.appType});

  final AppType appType;

  ThemeData light(AppColors colors) {
    const brightness = Brightness.light;
    final textTheme = AppTextTheme(colors: colors, brightness: brightness);
    return ThemeData(
      useMaterial3: true,
      textTheme: textTheme,
      scaffoldBackgroundColor: colors.surface,
      colorScheme: _getColorScheme(brightness, colors),
      extensions: [
        AppColorsExtension(colors: colors),
        AppTextThemeExtension(textTheme: textTheme),
        AppDimensionsExtension(dimensions: AppDimensions(appType: appType)),
      ],
    );
  }

  ThemeData dark(AppColors colors) {
    const brightness = Brightness.dark;
    final textTheme = AppTextTheme(colors: colors, brightness: brightness);
    return ThemeData.dark(useMaterial3: true).copyWith(
      textTheme: textTheme,
      scaffoldBackgroundColor: colors.surface,
      colorScheme: _getColorScheme(brightness, colors),
      extensions: [
        AppColorsExtension(colors: colors),
        AppTextThemeExtension(textTheme: textTheme),
        AppDimensionsExtension(dimensions: AppDimensions(appType: appType)),
      ],
    );
  }

  ColorScheme _getColorScheme(Brightness brightness, AppColors colors) {
    return switch (brightness) {
      Brightness.dark => ColorScheme.dark,
      Brightness.light => ColorScheme.light,
    }(
      error: colors.error,
      surface: colors.surface,
      primary: colors.primary,
      secondary: colors.secondary,
      onError: colors.onError,
      onSurface: colors.onSurface,
      onPrimary: colors.onPrimary,
      onSecondary: colors.onSecondary,
    );
  }
}
