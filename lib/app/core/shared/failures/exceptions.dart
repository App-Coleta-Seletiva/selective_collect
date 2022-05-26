import 'i_app_exception.dart';

class AppExceptionImpl extends IAppException {
  const AppExceptionImpl({
    required String message,
    required StackTrace? stackTrace,
  }) : super(message: message, stackTrace: stackTrace);
}

class AuthException extends AppExceptionImpl {
  const AuthException({
    required String message,
    required StackTrace? stackTrace,
  }) : super(message: message, stackTrace: stackTrace);
}
