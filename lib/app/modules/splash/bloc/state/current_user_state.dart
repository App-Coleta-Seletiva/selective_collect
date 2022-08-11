import '../../../auth/submodules/login/domain/entities/login_entity.dart';

import '../../../auth/submodules/login/domain/exceptions/login_exceptions.dart';

abstract class CurrentUserState {}

class CurrentUserInitial extends CurrentUserState {}

class CurrentUserLoading extends CurrentUserState {}

class CurrentUserSuccess extends CurrentUserState {
  final LoginEntity currentUserModel;
  CurrentUserSuccess({required this.currentUserModel});
}

class CurrentUserError extends CurrentUserState {
  final ILoginException exception;

  CurrentUserError(this.exception);
}
