import 'package:flutter/material.dart' show BuildContext, ColorScheme, MediaQuery, Size, Theme;
import 'package:portfolio/common/common.dart' show Environment, EnvironmentImpl;
import 'package:portfolio/ui/ui.dart' show AppMeasuriesExtension, AppTextThemeExtension;

extension BuildContextExtension on BuildContext {
  Size get appSize => MediaQuery.sizeOf(this);

  Environment get env => EnvironmentImpl();

  ColorScheme get colorScheme {
    return Theme.of(this).colorScheme;
  }

  AppMeasuriesExtension get measuries {
    return _getExtension();
  }

  AppTextThemeExtension get textTheme {
    return _getExtension();
  }

  T _getExtension<T>() {
    return Theme.of(this).extension<T>()!;
  }
}
