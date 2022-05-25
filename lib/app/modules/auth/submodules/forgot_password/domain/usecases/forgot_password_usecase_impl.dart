import 'package:fpdart/fpdart.dart';
import 'package:selective_collect/app/modules/auth/submodules/forgot_password/domain/entities/forgot_password_entity.dart';

import 'i_forgot_password_usecase.dart';

class ForgotPasswordUsecaseImpl extends IForgotPasswordUsecase {
  @override
  Future<Either<Exception, bool>> call(
      ForgotPasswordEntity forgotPassword) async {
    var result = forgotPassword.email.contains("@");
    if (result) {
      return Right(result);
    }
    return Left(Exception("Invalid Email"));
  }
}
