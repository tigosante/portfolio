import 'package:flutter/material.dart';
import 'package:portfolio/ui/theme/theme.dart';

class AppTheme {
  AppTheme({
    required this.colors,
    required this.measuries,
  });

  final AppColors colors;
  final AppMeasuries measuries;

  ThemeData dark() {
    return _getThme(_darkColorScheme);
  }

  ThemeData light() {
    return _getThme(_lightColorScheme);
  }

  ColorScheme get _darkColorScheme {
    return ColorScheme(
      brightness: Brightness.dark,
      error: colors.red,
      onError: colors.red,
      primary: colors.lighterGrey,
      onPrimary: colors.black87,
      secondary: colors.darkGrey,
      onSecondary: colors.lighterGrey,
      tertiary: colors.black87,
      onTertiary: colors.white,
      tertiaryFixed: colors.black95,
      onTertiaryFixed: colors.ultraLightGrey,
      surface: colors.black,
      onSurface: colors.lighterGrey,
      surfaceContainer: colors.black87,
      shadow: colors.transparent,
    );
  }

  ColorScheme get _lightColorScheme {
    return ColorScheme(
      brightness: Brightness.light,
      error: colors.red,
      onError: colors.red,
      primary: colors.black,
      onPrimary: colors.lighterGrey,
      secondary: colors.grey,
      onSecondary: colors.white,
      tertiary: colors.white,
      onTertiary: colors.black87,
      tertiaryFixed: colors.ultraLightGrey,
      onTertiaryFixed: colors.black95,
      surface: colors.lighterGrey,
      onSurface: colors.black,
      surfaceTint: colors.white,
      surfaceContainer: colors.white,
      shadow: colors.black87.withOpacity(0.04),
    );
  }

  ThemeData _getThme(ColorScheme colorScheme) {
    final textTheme = AppTextTheme(textColor: colorScheme.onSurface);
    return ThemeData(
      useMaterial3: true,
      textTheme: textTheme,
      colorScheme: colorScheme,
      brightness: colorScheme.brightness,
      scaffoldBackgroundColor: colorScheme.surface,
      cardTheme: CardTheme(
        elevation: 0,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        color: colorScheme.surfaceTint,
        shadowColor: colorScheme.shadow,
        surfaceTintColor: colorScheme.surfaceTint,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(measuries.borderRadiusLarge),
        ),
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        titleSpacing: 0,
        shadowColor: colorScheme.shadow,
        surfaceTintColor: colorScheme.shadow,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        titleTextStyle: textTheme.titleMedium.copyWith(
          color: colorScheme.surface,
          fontWeight: FontWeight.bold,
        ),
      ),
      extensions: [
        AppTextThemeExtension(textTheme: textTheme),
        AppMeasuriesExtension(measuries: measuries),
      ],
    );
  }
}
