import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart' show IModularNavigator, Modular;
import 'package:portfolio/common/common.dart';
import 'package:portfolio/common/router/app_router_params.dart';
import 'package:portfolio/common/router/exceptions/exceptions.dart';
import 'package:portfolio/common/router/router.dart';

class AppRouterImpl implements AppRouter {
  factory AppRouterImpl({required IModularNavigator provider}) => _instance ?? AppRouterImpl._(provider: provider);

  AppRouterImpl._({required IModularNavigator provider}) : _provider = provider;

  static AppRouterImpl? _instance;
  final IModularNavigator _provider;

  @override
  RouterDelegate<Object> get routerDelegate => Modular.routerDelegate;

  @override
  RouteInformationParser<Object> get routeInformationParser => Modular.routeInformationParser;

  @override
  void back() {
    _provider.pop();
  }

  @override
  void navigate(AppRouterEnum route, {Map<String, String?>? pathParams}) {
    try {
      final routeFix = _validatePathParams(_fixRoutePath(route.path), route, route.params, pathParams);
      _provider.pushNamed(routeFix).catchError((e) async => _provider.pushNamed('.$routeFix'));
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  @override
  void replaceAll(AppRouterEnum route) {
    _provider
      ..popUntil((_) => false)
      ..pushReplacementNamed(route.routePath);
  }

  String _validatePathParams(
    String routePath,
    AppRouterEnum route,
    AppRouterParams? routeParams,
    Map<String, String?>? pathParams,
  ) {
    if (pathParams != null && routeParams == null && !routeParams!.havePathParms) {
      throw RouteDontHavePathParamsAppRouterException(routePath: route.path);
    } else if (routeParams != null &&
        routeParams.havePathParms &&
        routeParams.validatePathParams(pathParams?.keys.toList(), route)) {
      final values = (pathParams?.values.toList() ?? [])..removeWhere((element) => element == null);
      return '$routePath${routeParams.getPathParams(values.cast())}';
    }

    return routePath;
  }

  String _fixRoutePath(String route) {
    final path = route.startsWith('/') ? route : '/$route';
    final pathFixed = path.endsWith('/') ? path : '$path/';
    return '.$pathFixed';
  }
}
