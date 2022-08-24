import '../../../../domain/types/params_type.dart';

abstract class LoginEvent {}

class NewLoginEvent extends LoginEvent {
  final LoginEmailParamsType params;

  NewLoginEvent(this.params);
}
