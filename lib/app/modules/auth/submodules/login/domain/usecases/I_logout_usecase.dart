import 'package:fpdart/fpdart.dart';

import '../../../../../../core/shared/failures/i_app_exception.dart';

abstract class ILogoutUsecase {
  Future<Either<IAppException, void>> call();
}
