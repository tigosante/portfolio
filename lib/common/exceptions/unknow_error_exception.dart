import 'package:portfolio/common/common.dart' show BaseException;

class UnknowErrorException extends BaseException {
  UnknowErrorException({required super.message, super.stackTrace}) : super(code: codeValue);

  static String codeValue = 'unknow_error';
}
