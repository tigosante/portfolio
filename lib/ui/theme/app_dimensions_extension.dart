import 'package:flutter/material.dart' show ThemeExtension;

class AppDimensionsExtension extends ThemeExtension<AppDimensionsExtension> {
  double get paddingNone => 0;
  double get paddingSmall => 8.0;
  double get paddingMedium => 16.0;
  double get paddingLarge => 24.0;
  double get paddingExtraLarge => 32.0;

  @override
  ThemeExtension<AppDimensionsExtension> copyWith() {
    return this;
  }

  @override
  ThemeExtension<AppDimensionsExtension> lerp(
    covariant ThemeExtension<AppDimensionsExtension>? other,
    double t,
  ) {
    return this;
  }
}
