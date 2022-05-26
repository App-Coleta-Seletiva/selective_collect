import 'package:fpdart/fpdart.dart';
import '../entities/register_entity.dart';

import '../../../../../../core/shared/failures/i_app_exception.dart';

abstract class IRegisterUsecase {
  Future<Either<IAppException, RegisterEntity>>call();
}

