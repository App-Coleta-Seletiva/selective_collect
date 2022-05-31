import '../../../../../../core/shared/failures/i_app_exception.dart';
import '../../../../../../core/types/either.dart';
import '../entities/register_entity.dart';

abstract class IRegisterRepository {
  
  Future<Either<IAppException,void>> call(RegisterEntity register);

}