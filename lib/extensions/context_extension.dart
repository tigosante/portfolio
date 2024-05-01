import 'package:flutter/material.dart';
import 'package:portfolio/ui/ui.dart'
    show AppColorsExtension, AppDimensionsExtension, AppTextThemeExtension;

extension BuildContextExtension on BuildContext {
  T _getExtension<T>() {
    return Theme.of(this).extension<T>()!;
  }

  AppColorsExtension get appColors {
    return _getExtension<AppColorsExtension>();
  }

  AppDimensionsExtension get appDimensions {
    return _getExtension<AppDimensionsExtension>();
  }

  AppTextThemeExtension get appTextTheme {
    return _getExtension<AppTextThemeExtension>();
  }
}
