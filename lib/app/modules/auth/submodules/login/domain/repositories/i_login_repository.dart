import '../../../../../../core/types/either.dart';
import '../../exeptions/login_exeptions.dart';
import '../types/params_type.dart';

abstract class ILoginRepository {
  Future<Either<ILoginException, Unit>> login(LoginEmailParamsType params);
  Future<void> logout();
}
