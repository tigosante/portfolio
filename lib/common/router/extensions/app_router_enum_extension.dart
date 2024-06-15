import 'package:portfolio/common/common.dart';

extension AppRouterEnumExtension on AppRouterEnum {
  String get routePath {
    return switch ([path.startsWith('/'), path.endsWith('/')]) {
      [false, true] => '/$path',
      [true, false] => '$path/',
      [false, false] => '/$path/',
      [true, true] || _ => path,
    };
  }
}
