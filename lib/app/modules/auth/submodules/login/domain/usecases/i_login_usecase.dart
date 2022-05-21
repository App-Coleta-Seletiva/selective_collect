import 'package:fpdart/fpdart.dart';
import '../entities/login_entity.dart';

import '../../../../../../core/shared/failures/i_app_exception.dart';

abstract class ILoginUsecase {
  Future<Either< IAppException, LoginEntity >>call();
}

