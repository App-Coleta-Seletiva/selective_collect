abstract class Failure implements Exception {}

class IAppFailure implements Failure {
  final String message;
  final StackTrace? stackTrace;
  const IAppFailure({
    required this.message,
    this.stackTrace,
  });
}

class InvalidEmailFailure extends IAppFailure {
  InvalidEmailFailure({
    String message = "Email Invalido",
    StackTrace? stackTrace,
  }) : super(message: message, stackTrace: stackTrace);
}

class EmptyEmailFailure extends IAppFailure {
  EmptyEmailFailure({
    String message = "Favor informar um email",
    StackTrace? stackTrace,
  }) : super(message: message, stackTrace: stackTrace);
}

class UserNotFoundFailure extends IAppFailure {
  UserNotFoundFailure({
    String message = "Usuário não encontrado",
    StackTrace? stackTrace,
  }) : super(message: message, stackTrace: stackTrace);
}
