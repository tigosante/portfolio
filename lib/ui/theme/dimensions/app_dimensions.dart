enum AppType {
  mobile,
  desktop;

  double applyFactor(double value) {
    if (value == 0) {
      return value;
    }

    return value *
        switch (this) {
          AppType.mobile => 1,
          AppType.desktop => 2.0,
        };
  }
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
}
