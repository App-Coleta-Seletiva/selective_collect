import '../../../../../../core/shared/failures/forgot_password_failure.dart';
import '../../../../../../core/types/either.dart';

abstract class IForgotPasswordUsecase {
  Future<Either<Failure, bool>> call(String email);
}
