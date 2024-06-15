import 'package:portfolio/common/router/exceptions/app_router_base_exception.dart';

class IcorrectPathParmsAppRouterException extends AppRouterBaseException {
  IcorrectPathParmsAppRouterException({required String routePath, required String pathParams})
      : super(_message.replaceFirst('_routePath_', routePath).replaceFirst('_pathParams_', pathParams));
  static const String _message = '\nRoute incorrect path params - /_routePath_/ - path params: _pathParams_';
}
