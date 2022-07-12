import 'package:selective_collect/app/core/shared/failures/i_app_exception.dart';

import '../../../../../../core/shared/services/auth/i_auth_service.dart';
import '../../../../../../core/types/either.dart';

abstract class IRegisterDatasource {
  Future<Either<IAppException, Unit>> registerWithEmail(
      RegisterWithEmailParam params);
}
