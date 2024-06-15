import 'package:portfolio/common/router/app_router_params.dart';

enum AppRouterEnum {
  root(path: '/'),
  home(path: '/');

  final String path;
  final AppRouterParams? params;

  const AppRouterEnum({required this.path, this.params});
}
