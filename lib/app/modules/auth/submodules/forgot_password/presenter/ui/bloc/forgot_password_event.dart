part of 'forgot_password_bloc.dart';

@immutable
abstract class ForgotPasswordEvent extends EqualHashOperator {}

class RecoverPasswordEvent extends ForgotPasswordEvent {
  final String email;
  RecoverPasswordEvent({
    required this.email,
  });

  @override
  List<Object?> get props => [email];
}
