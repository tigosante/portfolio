import 'package:flutter/widgets.dart' show RouteInformationParser, RouterDelegate;
import 'package:go_router/go_router.dart';
import 'package:portfolio/common/common.dart';
import 'package:portfolio/common/router/router.dart';

class AppRouterImpl implements AppRouter {
  factory AppRouterImpl({required GoRouter provider}) {
    _providerInstance = provider;
    return _instance ?? AppRouterImpl._();
  }

  AppRouterImpl._();

  static AppRouterImpl? _instance;

  static late GoRouter _providerInstance;

  @override
  GoRouter get routerConfig => _providerInstance;

  @override
  RouterDelegate<Object>? get routerDelegate => _providerInstance.routerDelegate;

  @override
  RouteInformationParser<Object>? get routeInformationParser => _providerInstance.routeInformationParser;

  @override
  void back() {
    _providerInstance.pop();
  }

  @override
  void navigate(AppRouterEnum route) {
    final routeFix = route.path.startsWith('/') ? route.path : '/${route.path}';
    final location =
        _providerInstance.location.endsWith('/') ? _providerInstance.location : '${_providerInstance.location}/';
    _providerInstance.push(location + routeFix);
  }

  @override
  void replaceAll(AppRouterEnum route) {
    var routeFix = route.path;
    if (route.path != AppRouterEnum.home.path) {
      routeFix = route.path.startsWith('/') ? route.path : '/${route.path}';
      routeFix = route.path.endsWith('/') ? route.path : '${route.path}/';
    }
    _providerInstance.pushReplacement(routeFix);
  }
}
