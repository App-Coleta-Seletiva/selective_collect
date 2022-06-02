import '../../../../../../core/shared/failures/i_app_exception.dart';
import '../../../../../../core/types/either.dart';
import '../types/register_params.dart';

abstract class IRegisterUsecase {
  Future<Either<IAppException, Unit>> call(
      RegisterParams params); //void ou bool?
}
