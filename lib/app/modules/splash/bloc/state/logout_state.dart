import '../../../auth/submodules/login/domain/exceptions/login_exceptions.dart';

abstract class CheckCurrentUserState {}

class CheckCurrentUserInitial extends CheckCurrentUserState {}

class CheckCurrentUserLoading extends CheckCurrentUserState {}

class CheckCurrentUserSuccess extends CheckCurrentUserState {}

class CheckCurrentUserError extends CheckCurrentUserState {
  final ILoginException exception;

  CheckCurrentUserError(this.exception);
}
