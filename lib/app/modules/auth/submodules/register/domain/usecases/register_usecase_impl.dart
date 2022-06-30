import '../../../../../../core/shared/failures/i_app_exception.dart';
import '../../../../../../core/shared/failures/register_errors.dart';
import '../../../../../../core/shared/services/auth/i_auth_service.dart';
import '../../../../../../core/types/either.dart';
import '../repositories/i_register_repository.dart';
import 'i_register_usecase.dart';

class RegisterUsecaseImpl implements IRegisterUsecase {
  final IRegisterRepository repository;

  RegisterUsecaseImpl(this.repository);

  @override
  Future<Either<IAppException, Unit>> call(
      RegisterWithEmailParam params) async {
    if (params.email.isEmpty) {
      return left(EmailError());
    }

    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(params.email)) {
      return left(EmailError());
    }
    if (params.password.length < 8) {
      return left(PasswordError());
    }

    final result = await repository(params);

    return result;
  }
}
