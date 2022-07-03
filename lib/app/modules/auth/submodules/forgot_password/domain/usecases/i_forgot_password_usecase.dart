import '../../../../../../core/shared/failures/i_app_exception.dart';
import '../../../../../../core/types/either.dart';

abstract class IForgotPassword {
  Future<Either<IAppException, bool>> call();
}
