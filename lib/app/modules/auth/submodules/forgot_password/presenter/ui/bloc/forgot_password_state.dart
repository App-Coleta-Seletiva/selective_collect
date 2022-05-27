part of 'forgot_password_bloc.dart';

@immutable
abstract class ForgotPasswordState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ForgotPasswordInitial extends ForgotPasswordState {}

class ForgotPasswordLoading extends ForgotPasswordState {}

class ForgotPasswordSucess extends ForgotPasswordState {}

class ForgotPasswordError extends ForgotPasswordState {
  final IAppFailure failure;
  ForgotPasswordError({required this.failure});

  @override
  List<Object?> get props => [failure];
}
