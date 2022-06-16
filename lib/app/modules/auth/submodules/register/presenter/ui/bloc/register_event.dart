import '../../../../../../../core/shared/services/auth/i_auth_service.dart';

abstract class RegisterEvent {}

class RegisterUser extends RegisterEvent {
  final RegisterWithEmailParam params;

  RegisterUser(this.params);
}
