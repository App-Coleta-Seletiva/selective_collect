import 'package:fpdart/fpdart.dart';

import '../../../../../../core/shared/failures/i_app_exception.dart';

abstract class IForgotPasswordUsecase {
  Future<Either<IAppFailure, bool>> call(String email);
}
