import 'package:portfolio/common/router/exceptions/app_router_base_exception.dart';

class IcorrectDataAppRouterException extends AppRouterBaseException {
  IcorrectDataAppRouterException({required String routePath, required Type type})
      : super(_message.replaceFirst('_routePath_', routePath).replaceFirst('_type_', type.toString()));
  static const String _message = '\nRoute incorrect data - /_routePath_/ - data type: _type_';
}
