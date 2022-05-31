import '../../../../../../core/shared/failures/forgot_password_failure.dart';
import '../../../../../../core/types/either.dart';
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
      return left(EmptyEmailFailure());
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      return left(InvalidEmailFailure());
    }
    return await repository(email);
  }
}
