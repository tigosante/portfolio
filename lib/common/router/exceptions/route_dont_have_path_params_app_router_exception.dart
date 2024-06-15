import 'package:portfolio/common/router/exceptions/app_router_base_exception.dart';

class RouteDontHavePathParamsAppRouterException extends AppRouterBaseException {
  RouteDontHavePathParamsAppRouterException({required String routePath})
      : super(_message.replaceFirst('_routePath_', routePath));
  static const String _message = 'route dont have path params - /_routePath_/';
}
