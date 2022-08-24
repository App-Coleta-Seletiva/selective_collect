import 'package:selective_collect/app/modules/auth/submodules/login/domain/entities/corrent_user_entity.dart';

import '../../../../../../core/shared/services/auth/i_auth_service.dart';

class CurrentUserEntityAdapter {
  static CurrentUserEntity fromUserEntityService(UserEntityService service) {
    return CurrentUserEntity(email: service.email);
  }
}
