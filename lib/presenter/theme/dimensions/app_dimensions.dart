enum AppType {
  none,
  mobile,
  desktop;
}

class AppDimensions {
  AppDimensions({
    required this.appType,
    this.noneValue = 0,
    this.smallValue = 8.0,
    this.mediumValue = 16.0,
    this.largeValue = 24.0,
    this.extraLargeValue = 32.0,
    this.screenMaxWidth = 1250,
  });

  final AppType appType;

  final double noneValue;
  final double smallValue;
  final double mediumValue;
  final double largeValue;
  final double extraLargeValue;
  final double screenMaxWidth;

  double get borderRadiusNone => noneValue;
  double get borderRadiusSmall => smallValue;
  double get borderRadiusMedium => mediumValue;
  double get borderRadiusLarge => largeValue;

  double get paddingNone => noneValue;
  double get paddingSmall => smallValue;
  double get paddingMedium => mediumValue;
  double get paddingLarge => largeValue;
  double get paddingExtraLarge => extraLargeValue;
}
