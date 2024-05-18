import 'package:flutter/foundation.dart' show debugPrint;

class BaseException implements Exception {
  BaseException({
    required this.message,
    required String code,
    this.stackTrace,
  }) : code = '$codeValue$code';

  final String message;
  final String code;
  final StackTrace? stackTrace;

  static String codeValue = 'exceptions.';

  @override
  String toString() {
    if (stackTrace != null) {
      debugPrint(stackTrace.toString());
    }
    return 'BaseException{message: $message, code: $code}';
  }
}
