enum AppType {
  none(factor: 1),
  mobile(factor: 1),
  desktop(factor: 2);

  final double factor;

  double applyFactor(double value) {
    return value == 0 ? value : value * factor;
  }

  const AppType({required this.factor});
}

class AppDimensions {
  AppDimensions({
    required this.appType,
    this.noneValue = 0,
    this.smallValue = 8.0,
    this.mediumValue = 16.0,
    this.largeValue = 24.0,
    this.extraLargeValue = 32.0,
  });

  static AppDimensions? _appDimensions;

  final AppType appType;

  final double noneValue;
  final double smallValue;
  final double mediumValue;
  final double largeValue;
  final double extraLargeValue;

  double get borderRadiusNone => appType.applyFactor(noneValue);
  double get borderRadiusSmall => appType.applyFactor(smallValue);
  double get borderRadiusMedium => appType.applyFactor(mediumValue);
  double get borderRadiusLarge => appType.applyFactor(largeValue);

  double get paddingNone => appType.applyFactor(noneValue);
  double get paddingSmall => appType.applyFactor(smallValue);
  double get paddingMedium => appType.applyFactor(mediumValue);
  double get paddingLarge => appType.applyFactor(largeValue);
  double get paddingExtraLarge => appType.applyFactor(extraLargeValue);

  AppDimensions get noFactor => _appDimensions ??= AppDimensions(
        appType: AppType.none,
        noneValue: noneValue,
        smallValue: smallValue,
        mediumValue: mediumValue,
        largeValue: largeValue,
        extraLargeValue: extraLargeValue,
      );
}
