import '../../../auth/submodules/login/domain/exceptions/login_exceptions.dart';
import '../../models/current_user_model.dart';

abstract class CurrentUserState {}

class CurrentUserInitial extends CurrentUserState {}

class CurrentUserLoading extends CurrentUserState {}

class CurrentUserSuccess extends CurrentUserState {
  final CurrentUserModel currentUserModel;
  CurrentUserSuccess({required this.currentUserModel});
}

class CurrentUserError extends CurrentUserState {
  final ILoginException exception;

  CurrentUserError(this.exception);
}
