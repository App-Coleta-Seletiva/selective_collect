import 'package:selective_collect/app/modules/auth/submodules/login/exeptions/login_exeptions.dart';

import '../../../../../../../core/shared/failures/i_app_exception.dart';
import '../../../domain/types/params_type.dart';

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
