import '../../../../../../core/shared/failures/i_app_exception.dart';
import '../../../../../../core/types/either.dart';
import '../types/params.dart';

abstract class ILoginRepository {
  Future<Either<IAppException, Unit>> login(LoginEmailParams params);
}
