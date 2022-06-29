import '../../../../../../core/shared/failures/i_app_exception.dart';
import '../../../../../../core/types/either.dart';
import '../types/params_type.dart';

abstract class ILoginRepository {
  Future<Either<IAppException, Unit>> login(LoginEmailParamsType params);
  Future<void> logout();
}
