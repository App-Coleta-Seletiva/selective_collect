import '../../../../domain/exceptions/login_exceptions.dart';

import '../../../../domain/types/params_type.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginEmailParamsType params;

  LoginSuccess(this.params);
}

class LoginError extends LoginState {
  final ILoginException exception;

  LoginError(this.exception);
}
