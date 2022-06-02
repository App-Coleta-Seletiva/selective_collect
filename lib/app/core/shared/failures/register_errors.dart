import 'errors.dart';

class EmailError extends AppError {
  const EmailError({
    String message = 'E-mail invalido',
    StackTrace? stackTrace,
  }) : super(message: message, stackTrace: stackTrace);
}

class PasswordError extends AppError {
  const PasswordError({
    String message = 'Senha deve possuir 8 ou mais caracteres',
    StackTrace? stackTrace,
  }) : super(message: message, stackTrace: stackTrace);
}
