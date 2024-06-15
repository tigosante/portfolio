abstract class AppRouterBaseException implements Exception {
  AppRouterBaseException(String message) : message = '\n$message - [AppRouer | App Exception]';

  final String message;

  @override
  String toString() {
    return message;
  }
}
