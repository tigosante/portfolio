import 'package:portfolio/common/common.dart' show BaseException;

class ApiErrorException extends BaseException {
  ApiErrorException({required super.message, super.stackTrace}) : super(code: codeValue);

  static String codeValue = 'api_error';
}
