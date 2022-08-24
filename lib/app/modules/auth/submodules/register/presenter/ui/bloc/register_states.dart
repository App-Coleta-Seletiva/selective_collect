import 'package:selective_collect/app/core/shared/failures/i_app_exception.dart';

abstract class RegisterState {}

class InitialRegisterState extends RegisterState {}

class LoadingRegisterState extends RegisterState {}

class SuccessRegisterState extends RegisterState {}

class ExceptionRegisterState extends RegisterState {
  final IAppException exception;

  ExceptionRegisterState(this.exception);
}
