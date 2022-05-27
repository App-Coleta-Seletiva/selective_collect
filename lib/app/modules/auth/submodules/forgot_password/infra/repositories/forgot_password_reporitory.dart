import 'package:fpdart/fpdart.dart';

import '../../../../../../core/shared/failures/forgot_password_failure.dart';
import '../../../../../../core/shared/services/auth/i_auth_service.dart';
import '../../domain/repositories/i_forgot_password_reporitory.dart';

class ForgotPasswordRepositoryImpl extends IForgotPasswordRepository {
  final IAuthService service;

  ForgotPasswordRepositoryImpl({
    required this.service,
  });

  @override
  Future<Either<Failure, bool>> call(String email) async {
    try {
      await service.forgotPassword(email);
      return const Right(true);
    } on InvalidEmailFailure {
      return Left(InvalidEmailFailure());
    } on UserNotFoundFailure {
      return Left(UserNotFoundFailure());
    } catch (e, s) {
      return left(IAppFailure(message: e.toString(), stackTrace: s));
    }
  }
}
