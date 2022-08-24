import '../../../../../../core/shared/services/auth/i_auth_service.dart';
import '../../domain/entities/login_entity.dart';

class LoginEntityAdapter {
  static LoginEntity fromUserEntityService(UserEntityService service) {
    return LoginEntity(email: service.email);
  }
}
