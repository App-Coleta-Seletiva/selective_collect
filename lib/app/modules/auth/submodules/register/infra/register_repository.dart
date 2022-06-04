import 'package:selective_collect/app/core/shared/failures/register_errors.dart';

import '../../../../../core/shared/failures/exceptions.dart';
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
    try {
      await serviceRegister.registerWithEmail(params);
      return right(unit);
    } on EmailError {
      return left(const EmailError());
    } on PasswordError {
      return left(const PasswordError());
    } catch (e, s) {
      return left(AuthException(message: e.toString(), stackTrace: s));
    }
  }
}
