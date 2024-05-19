import 'package:flutter/material.dart' show ThemeExtension;
import 'package:portfolio/presenter/theme/dimensions/app_dimensions.dart';

class AppDimensionsExtension extends ThemeExtension<AppDimensionsExtension> implements AppDimensions {
  AppDimensionsExtension({
    required AppDimensions dimensions,
  }) : _dimensions = dimensions;

  final AppDimensions _dimensions;

  @override
  AppType get appType => _dimensions.appType;

  @override
  double get noneValue => _dimensions.noneValue;

  @override
  double get smallValue => _dimensions.smallValue;

  @override
  double get mediumValue => _dimensions.mediumValue;

  @override
  double get largeValue => _dimensions.largeValue;

  @override
  double get extraLargeValue => _dimensions.extraLargeValue;

  @override
  double get screenMaxWidth => _dimensions.screenMaxWidth;

  @override
  double get borderRadiusNone => _dimensions.borderRadiusNone;

  @override
  double get borderRadiusSmall => _dimensions.borderRadiusSmall;

  @override
  double get borderRadiusMedium => _dimensions.borderRadiusMedium;

  @override
  double get borderRadiusLarge => _dimensions.borderRadiusLarge;

  @override
  double get paddingNone => _dimensions.paddingNone;

  @override
  double get paddingSmall => _dimensions.paddingSmall;

  @override
  double get paddingMedium => _dimensions.paddingMedium;

  @override
  double get paddingLarge => _dimensions.paddingLarge;

  @override
  double get paddingExtraLarge => _dimensions.paddingExtraLarge;

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
