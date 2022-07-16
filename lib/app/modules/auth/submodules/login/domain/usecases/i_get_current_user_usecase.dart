import 'package:selective_collect/app/core/types/either.dart';
import '../../exceptions/login_exceptions.dart';

import '../entities/login_entity.dart';

abstract class IGetCurrentuserUsecase {
  Either<ILoginException, LoginEntity>   getCurrentUserUsecase();
}
