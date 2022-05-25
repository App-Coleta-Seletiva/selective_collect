import 'package:fpdart/fpdart.dart';
import 'package:selective_collect/app/modules/auth/submodules/forgot_password/domain/entities/forgot_password_entity.dart';

abstract class IForgotPasswordRepository {
  Future<Either<Exception, bool>> call(ForgotPasswordEntity forgotPassword);
}
