import 'package:portfolio/ui/ui.dart' show AppMeasuriesThemeExtension;

extension AppMeasuriesExtension on AppMeasuriesThemeExtension {
  double get horizontalScreenPadding {
    return maxWidth > screenWidth ? 0 : screenWidth - maxWidth;
  }
}
