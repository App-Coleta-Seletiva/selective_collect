import 'package:fpdart/fpdart.dart';

import '../../../../../../core/shared/failures/forgot_password_failure.dart';

abstract class IDatasource {
  Future<Either<Failure, bool>> recoveryPasswordByMail(String email);
}
