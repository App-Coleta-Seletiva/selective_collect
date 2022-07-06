import '../../../../../../core/types/either.dart';
import '../../exeptions/login_exeptions.dart';
import '../types/params_type.dart';

abstract class ILoginUsecase {
  Future<Either<ILoginException, Unit>> call(LoginEmailParamsType params);
}
