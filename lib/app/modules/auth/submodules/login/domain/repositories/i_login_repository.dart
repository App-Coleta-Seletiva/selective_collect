import '../../../../../../core/types/either.dart';
import '../../exceptions/login_exceptions.dart';
import '../types/params_type.dart';

abstract class ILoginRepository {
  Future<Either<ILoginException, Unit>> login(LoginEmailParamsType params);
  Future<void> logout();
}
