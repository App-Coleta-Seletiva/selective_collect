import 'package:fpdart/fpdart.dart';

abstract class IForgotPasswordUsecase {
  Future<Either<Exception, bool>> call(String email);
}
