import '../../../../../../core/types/either.dart';

import '../entities/login_entity.dart';
import '../exceptions/login_exceptions.dart';

abstract class IGetCurrentuserUsecase {
  Either<ILoginException, LoginEntity> call();
}
