import '../../../../../../core/types/either.dart';
import '../../exceptions/login_exceptions.dart';
import '../entities/login_entity.dart';
import '../types/params_type.dart';

abstract class ILoginRepository {
  Future<Either<ILoginException, Unit>> login(LoginEmailParamsType params);
  Either<ILoginException, LoginEntity>  getCurrentUserdatasource();
  Future<void> logout();
}
