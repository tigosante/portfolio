import 'package:flutter/material.dart' show RouteInformationParser, RouterDelegate;
import 'package:go_router/go_router.dart' show GoRouter;
import 'package:portfolio/presenter/router/app_router_enum.dart';

mixin AppRouter {
  GoRouter get routerConfig;
  RouterDelegate<Object>? get routerDelegate;
  RouteInformationParser<Object>? get routeInformationParser;

  void back();
  void provider(GoRouter provider);
  void navigate(AppRouterEnum route);
  void replaceAll(AppRouterEnum route);
}
