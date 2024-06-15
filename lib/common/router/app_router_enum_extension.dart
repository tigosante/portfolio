import 'package:portfolio/common/common.dart';

extension AppRouterEnumExtension on AppRouterEnum {
  String get routePath {
    var pathFixed = path;
    if (!path.startsWith('/')) pathFixed = '/$path';
    if (!path.endsWith('/')) pathFixed = '$pathFixed/';
    return pathFixed;
  }

  String routePathWithParams(Map<String, String> bindParams) {
    if (params.isEmpty) return routePath;
    return routePath + params.keys.map((key) => bindParams[key] ?? '').reduce((combined, next) => '$combined/$next');
  }
}
