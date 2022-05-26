import 'package:fpdart/fpdart.dart';

import '../../../../../../core/shared/failures/forgot_password_failure.dart';

abstract class IForgotPasswordUsecase {
  Future<Either<Failure, bool>> call(String email);
}
