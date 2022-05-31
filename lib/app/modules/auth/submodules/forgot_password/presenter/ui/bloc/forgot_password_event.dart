part of 'forgot_password_bloc.dart';

@immutable
abstract class ForgotPasswordEvent {}

class RecoverPasswordEvent extends ForgotPasswordEvent {
  final String email;
  RecoverPasswordEvent({
    required this.email,
  });
}
