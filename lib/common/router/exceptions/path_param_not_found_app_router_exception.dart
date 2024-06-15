import 'package:portfolio/common/router/exceptions/app_router_base_exception.dart';

class PathParamNotFoundAppRouterException extends AppRouterBaseException {
  PathParamNotFoundAppRouterException({
    required String param,
    required String routePath,
    required String pathParamsKeys,
  }) : super(
          _message
              .replaceFirst('_param_', param)
              .replaceFirst('_routePath_', routePath)
              .replaceFirst('_pathParamsKeys_', pathParamsKeys),
        );
  static const String _message = 'path param not found - _param_\nparams of route /_routePath_/ - _pathParamsKeys_';
}
