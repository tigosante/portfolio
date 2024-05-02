import 'package:flutter/material.dart';
import 'package:portfolio/ui/ui.dart'
    show
        AppColorsExtension,
        AppDimensionsExtension,
        AppTextThemeExtension,
        AppType;

extension BuildContextExtension on BuildContext {
  AppType get appType {
    final width = MediaQuery.sizeOf(this).width;
    return width > 640 ? AppType.desktop : AppType.mobile;
  }

  Size get appSize => MediaQuery.sizeOf(this);

  AppColorsExtension get appColors {
    return _getExtension<AppColorsExtension>();
  }

  AppDimensionsExtension get appDimensions {
    return _getExtension<AppDimensionsExtension>();
  }

  AppTextThemeExtension get appTextTheme {
    return _getExtension<AppTextThemeExtension>();
  }

  T _getExtension<T>() {
    return Theme.of(this).extension<T>()!;
  }
}
