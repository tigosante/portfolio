import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show BuildContext, ThemeExtension;
import 'package:portfolio/ui/theme/measuries/app_measuries.dart';

class AppMeasuriesThemeExtension extends ThemeExtension<AppMeasuriesThemeExtension> implements AppMeasuries {
  AppMeasuriesThemeExtension({
    required AppMeasuries measuries,
  }) : _measuries = measuries;

  final AppMeasuries _measuries;

  @override
  double get none => _measuries.none;

  @override
  double get borderRadiusSmall => _measuries.borderRadiusSmall;

  @override
  double get borderRadiusMedium => _measuries.borderRadiusMedium;

  @override
  double get borderRadiusLarge => _measuries.borderRadiusLarge;

  @override
  double get paddingSmall => _measuries.paddingSmall.factor;

  @override
  double get paddingMedium => _measuries.paddingMedium.factor;

  @override
  double get paddingLarge => _measuries.paddingLarge.factor;

  @override
  double get paddingExtraLarge => _measuries.paddingExtraLarge.factor;

  @override
  double get maxWidth => _measuries.maxWidth;

  @override
  double get screenWidth => _measuries.screenWidth;

  @override
  void setContext(BuildContext context) {
    _measuries.setContext(context);
  }

  @override
  ThemeExtension<AppMeasuriesThemeExtension> copyWith() {
    return this;
  }

  @override
  ThemeExtension<AppMeasuriesThemeExtension> lerp(
    covariant ThemeExtension<AppMeasuriesThemeExtension>? other,
    double t,
  ) {
    return this;
  }
}

extension on double {
  double get factor => this * (kIsWeb ? 2 : 1);
}
