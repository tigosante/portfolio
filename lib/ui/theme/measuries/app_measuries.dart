import 'package:flutter/material.dart' show BuildContext;

mixin AppMeasuries {
  double get none;

  double get borderRadiusSmall;
  double get borderRadiusMedium;
  double get borderRadiusLarge;

  double get paddingSmall;
  double get paddingMedium;
  double get paddingLarge;
  double get paddingExtraLarge;

  double get maxWidth;
  double get screenWidth;

  void setContext(BuildContext context);
}
