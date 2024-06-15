import 'package:portfolio/common/router/exceptions/app_router_base_exception.dart';

class RouteDontHaveQueryParamsAppRouterException extends AppRouterBaseException {
  RouteDontHaveQueryParamsAppRouterException({required String routePath})
      : super(_message.replaceFirst('_routePath_', routePath));
  static const String _message = 'route dont have query params - /_routePath_/';
}
