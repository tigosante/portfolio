import 'package:portfolio/presenter/presenter.dart' show AppType;

extension AppTypeExtension on AppType {
  bool get isMobile => this == AppType.mobile;
  bool get isDesktop => this == AppType.desktop;
}
