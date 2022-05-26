import 'package:fpdart/fpdart.dart';

abstract class IForgotPasswordRepository {
  Future<Either<Exception, bool>> call(String email);
}
