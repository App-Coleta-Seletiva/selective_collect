abstract class Failure implements Exception {}

class IAppFailure implements Failure {
  final String message;
  final StackTrace? stackTrace;
  const IAppFailure({
    required this.message,
    this.stackTrace,
  });
}

class InvalidEmail extends IAppFailure {
  InvalidEmail({
    String message = "Email Invalido",
    StackTrace? stackTrace,
  }) : super(message: message, stackTrace: stackTrace);
}

class EmptyEmail extends IAppFailure {
  EmptyEmail({
    String message = "Favor informar um email",
    StackTrace? stackTrace,
  }) : super(message: message, stackTrace: stackTrace);
}
