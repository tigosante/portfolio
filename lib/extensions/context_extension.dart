import 'package:flutter/material.dart';
import 'package:portfolio/ui/ui.dart'
    show AppColorsExtension, AppTextThemeExtension;

extension BuildContextExtension on BuildContext {
  AppColorsExtension get appColors {
    return Theme.of(this).extension<AppColorsExtension>()!;
  }

  AppTextThemeExtension get appTextTheme {
    return Theme.of(this).extension<AppTextThemeExtension>()!;
  }
}
