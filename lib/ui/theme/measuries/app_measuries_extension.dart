import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show ThemeExtension;
import 'package:portfolio/ui/theme/measuries/app_measuries.dart';

class AppMeasuriesExtension extends ThemeExtension<AppMeasuriesExtension> implements AppMeasuries {
  AppMeasuriesExtension({
    required AppMeasuries measuries,
  }) : _measuries = measuries;

  final AppMeasuries _measuries;

  @override
  double get noneValue => _measuries.noneValue;

  @override
  double get smallValue => _measuries.smallValue;

  @override
  double get mediumValue => _measuries.mediumValue;

  @override
  double get largeValue => _measuries.largeValue;

  @override
  double get extraLargeValue => _measuries.extraLargeValue;

  @override
  double get borderRadiusNone => _measuries.borderRadiusNone;

  @override
  double get borderRadiusSmall => _measuries.borderRadiusSmall;

  @override
  double get borderRadiusMedium => _measuries.borderRadiusMedium;

  @override
  double get borderRadiusLarge => _measuries.borderRadiusLarge;

  @override
  double get paddingNone => _measuries.paddingNone;

  @override
  double get paddingSmall => _measuries.paddingSmall.factor;

  @override
  double get paddingMedium => _measuries.paddingMedium.factor;

  @override
  double get paddingLarge => _measuries.paddingLarge.factor;

  @override
  double get paddingExtraLarge => _measuries.paddingExtraLarge.factor;

  @override
  ThemeExtension<AppMeasuriesExtension> copyWith() {
    return this;
  }

  @override
  ThemeExtension<AppMeasuriesExtension> lerp(
    covariant ThemeExtension<AppMeasuriesExtension>? other,
    double t,
  ) {
    return this;
  }
}

extension on double {
  double get factor => this * (kIsWeb ? 2 : 1);
}
