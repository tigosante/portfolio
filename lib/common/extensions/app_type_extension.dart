import 'package:portfolio/ui/ui.dart' show AppType;

extension AppTypeExtension on AppType {
  bool get isMobile => this == AppType.mobile;
  bool get isDesktop => this == AppType.desktop;
}
