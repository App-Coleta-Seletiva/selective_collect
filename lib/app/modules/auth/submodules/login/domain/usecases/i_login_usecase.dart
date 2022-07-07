import '../../../../../../core/types/either.dart';
import '../../exceptions/login_exceptions.dart';
import '../types/params_type.dart';

abstract class ILoginUsecase {
  Future<Either<ILoginException, Unit>> call(LoginEmailParamsType params);
}
