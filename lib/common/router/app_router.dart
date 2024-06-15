import 'package:flutter/material.dart';
import 'package:portfolio/common/router/app_router_enum.dart';

mixin AppRouter {
  RouterDelegate<Object> get routerDelegate;
  RouteInformationParser<Object> get routeInformationParser;

  void back();
  void navigate(
    AppRouterEnum route, {
    Map<String, String> pathParams,
  });
  void replaceAll(AppRouterEnum route);
}
