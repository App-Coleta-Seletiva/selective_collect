import '../../../../../core/shared/failures/i_app_exception.dart';

abstract class ILoginException implements IAppException {
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
