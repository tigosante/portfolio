import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart' show IModularNavigator, Modular;
import 'package:portfolio/common/common.dart';
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
  void navigate(AppRouterEnum route, {Map<String, String> pathParams = const {}}) {
    try {
      final routePath = route.routePathWithParams(pathParams);
      _provider.pushNamed(routePath).catchError((e) async => _provider.pushNamed('.$routePath'));
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
}
