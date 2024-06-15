import 'package:portfolio/common/router/app_router_enum.dart';
import 'package:portfolio/common/router/exceptions/exceptions.dart';

mixin AppRouterParams {
  bool get havePathParms;
  List<String> get pathParamsKeys;
  String getPathParams(List<String>? params);
  bool validatePathParams(List<String>? params, AppRouterEnum route);
}

class AppRouterParamsImpl implements AppRouterParams {
  const AppRouterParamsImpl({
    required List<String> pathParamsType,
  }) : _pathParamsType = pathParamsType;

  final List<String> _pathParamsType;

  @override
  String getPathParams(List<String>? params) {
    return params?.isEmpty ?? true ? '' : params!.join('/');
  }

  @override
  bool get havePathParms => pathParamsKeys.isNotEmpty;

  @override
  List<String> get pathParamsKeys => _pathParamsType;

  String get _pathParamsToString => pathParamsKeys.join('/');

  @override
  bool validatePathParams(List<String>? params, AppRouterEnum route) {
    if (params == null) {
      throw IcorrectPathParmsAppRouterException(routePath: route.path, pathParams: _pathParamsToString);
    }

    if (params.length != pathParamsKeys.length) {
      throw IcorrectPathParmsAppRouterException(routePath: route.path, pathParams: _pathParamsToString);
    }

    for (final key in pathParamsKeys) {
      if (!params.contains(key)) {
        throw PathParamNotFoundAppRouterException(
          param: key,
          routePath: route.path,
          pathParamsKeys: _pathParamsToString,
        );
      }
    }

    return true;
  }
}
