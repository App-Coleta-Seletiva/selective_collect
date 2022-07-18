abstract class ILoginException implements Exception {
  final String message;
  final StackTrace? stackTrace;
  const ILoginException({
    required this.message,
    required this.stackTrace,
  });
}

class LoginException extends ILoginException {
  const LoginException({
    required String message,
    required StackTrace? stackTrace,
  }) : super(message: message, stackTrace: stackTrace);
}
