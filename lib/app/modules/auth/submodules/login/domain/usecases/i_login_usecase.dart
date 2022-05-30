import '../../../../../../core/shared/failures/i_app_exception.dart';
import '../../../../../../core/types/either.dart';
import '../types/params.dart';

abstract class ILoginUsecase {
  Future<Either<IAppException, Unit>> call(LoginEmailParams params);
}
