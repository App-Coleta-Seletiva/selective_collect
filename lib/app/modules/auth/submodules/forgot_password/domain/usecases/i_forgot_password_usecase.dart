import 'package:fpdart/fpdart.dart';

import '../entities/forgot_password_entity.dart';

abstract class IForgotPasswordUsecase {
  Future<Either<Exception, bool>> call(ForgotPasswordEntity forgotPassword);
}
