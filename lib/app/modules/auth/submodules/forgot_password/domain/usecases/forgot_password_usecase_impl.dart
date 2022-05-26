import 'package:fpdart/fpdart.dart';

import 'package:selective_collect/app/modules/auth/submodules/forgot_password/domain/repositories/i_forgot_password_reporitory.dart';

import 'i_forgot_password_usecase.dart';

class ForgotPasswordUsecaseImpl extends IForgotPasswordUsecase {
  final IForgotPasswordRepository repository;
  ForgotPasswordUsecaseImpl({
    required this.repository,
  });

  @override
  Future<Either<Exception, bool>> call(String email) async {
    if (email.isEmpty) {
      return Left(Exception("Empty email"));
    }

    if (!email.contains("@")) {
      return Left(Exception("Invalid email"));
    }

    return await repository(email);
  }
}
