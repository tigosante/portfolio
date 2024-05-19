import 'package:flutter/material.dart' show Brightness, BuildContext, MediaQuery, Size, Theme;
import 'package:portfolio/common/common.dart' show Environment, EnvironmentImpl;
import 'package:portfolio/presenter/presenter.dart'
    show AppColorsExtension, AppDimensionsExtension, AppTextThemeExtension, AppType;

extension BuildContextExtension on BuildContext {
  AppType get appType {
    final width = MediaQuery.sizeOf(this).width;
    return width > 640 ? AppType.desktop : AppType.mobile;
  }

  Brightness get brightness => Theme.of(this).brightness;

  Size get appSize => MediaQuery.sizeOf(this);

  Environment get env => EnvironmentImpl();

  AppColorsExtension get colors {
    return _getExtension<AppColorsExtension>();
  }

  AppDimensionsExtension get dimensions {
    return _getExtension<AppDimensionsExtension>();
  }

  AppTextThemeExtension get textTheme {
    return _getExtension<AppTextThemeExtension>();
  }

  T _getExtension<T>() {
    return Theme.of(this).extension<T>()!;
  }
}
