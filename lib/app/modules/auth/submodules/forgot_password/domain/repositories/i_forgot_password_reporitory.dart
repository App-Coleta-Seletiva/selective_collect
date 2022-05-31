import '../../../../../../core/shared/failures/forgot_password_failure.dart';
import '../../../../../../core/types/either.dart';

abstract class IForgotPasswordRepository {
  Future<Either<Failure, bool>> call(String email);
}
