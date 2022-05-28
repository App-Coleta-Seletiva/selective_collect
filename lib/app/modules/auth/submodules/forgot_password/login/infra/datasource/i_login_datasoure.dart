import '../../../../../../../core/shared/failures/i_app_exception.dart';
import '../../../../../../../core/types/either.dart';
import '../../domain/types/params.dart';

abstract class ILoginDatasouce {
  Future<Either<IAppException, Unit>> call(LoginEmailParams params);
}
