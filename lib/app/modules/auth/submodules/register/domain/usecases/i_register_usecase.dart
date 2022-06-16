import '../../../../../../core/shared/failures/i_app_exception.dart';
import '../../../../../../core/shared/services/auth/i_auth_service.dart';
import '../../../../../../core/types/either.dart';

abstract class IRegisterUsecase {
  Future<Either<IAppException, Unit>> call(
      RegisterWithEmailParam params);
}
