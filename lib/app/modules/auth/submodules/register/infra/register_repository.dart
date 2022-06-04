import '../../../../../core/shared/failures/i_app_exception.dart';
import '../../../../../core/shared/services/auth/i_auth_service.dart';
import '../../../../../core/types/either.dart';
import '../domain/repositories/i_register_repository.dart';

class RegisterRepositoryImpl extends IRegisterRepository {
  final IAuthService serviceRegister;

  RegisterRepositoryImpl(this.serviceRegister);

  @override
  Future<Either<IAppException, Unit>> call(
      RegisterWithEmailParam params) async {
    throw UnimplementedError();
  }
}
