import 'package:selective_collect/app/core/shared/failures/i_app_exception.dart';

abstract class IErrosRegister extends IAppException {
  IErrosRegister({required String message, required StackTrace? stackTrace})
      : super(message: message, stackTrace: stackTrace);
}

class EmailError extends IErrosRegister {
  EmailError({
    String message = 'E-mail invalido',
    StackTrace? stackTrace,
  }) : super(message: message, stackTrace: stackTrace);
}

class PasswordError extends IErrosRegister {
  PasswordError({
    String message = 'Senha deve possuir 8 ou mais caracteres',
    StackTrace? stackTrace,
  }) : super(message: message, stackTrace: stackTrace);

}

class RegisterError extends IErrosRegister {
  RegisterError({
    String message = 'Erro ao registrar usuário.',
    StackTrace? stackTrace,
  }) : super(message: message, stackTrace: stackTrace);

}


