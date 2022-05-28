import 'package:fpdart/fpdart.dart';

import '../../../../../../core/shared/failures/forgot_password_failure.dart';
import '../repositories/i_forgot_password_reporitory.dart';
import 'i_forgot_password_usecase.dart';

class ForgotPasswordUsecaseImpl extends IForgotPasswordUsecase {
  final IForgotPasswordRepository repository;
  ForgotPasswordUsecaseImpl({
    required this.repository,
  });

  @override
  Future<Either<Failure, bool>> call(String email) async {
    if (email.isEmpty) {
      return Left(EmptyEmailFailure());
    }
    if (!email.contains("@")) {
      return Left(InvalidEmailFailure());
    }
    return await repository(email);
  }
}
