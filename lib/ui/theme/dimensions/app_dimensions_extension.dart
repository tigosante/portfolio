import 'package:flutter/material.dart' show ThemeExtension;
import 'package:portfolio/ui/theme/dimensions/app_dimensions.dart';

class AppDimensionsExtension extends ThemeExtension<AppDimensionsExtension>
    implements AppDimensions {
  AppDimensionsExtension({
    required AppDimensions appDimensions,
  }) : _appDimensions = appDimensions;

  final AppDimensions _appDimensions;

  @override
  AppType get appType => _appDimensions.appType;

  @override
  double get noneValue => _appDimensions.noneValue;

  @override
  double get smallValue => _appDimensions.smallValue;

  @override
  double get mediumValue => _appDimensions.mediumValue;

  @override
  double get largeValue => _appDimensions.largeValue;

  @override
  double get extraLargeValue => _appDimensions.extraLargeValue;

  @override
  double get borderRadiusNone => _appDimensions.borderRadiusNone;

  @override
  double get borderRadiusSmall => _appDimensions.borderRadiusSmall;

  @override
  double get borderRadiusMedium => _appDimensions.borderRadiusMedium;

  @override
  double get borderRadiusLarge => _appDimensions.borderRadiusLarge;

  @override
  double get paddingNone => _appDimensions.paddingNone;

  @override
  double get paddingSmall => _appDimensions.paddingSmall;

  @override
  double get paddingMedium => _appDimensions.paddingMedium;

  @override
  double get paddingLarge => _appDimensions.paddingLarge;

  @override
  double get paddingExtraLarge => _appDimensions.paddingExtraLarge;

  @override
  AppDimensions get noFactor => _appDimensions.noFactor;

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
