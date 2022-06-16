import 'package:selective_collect/app/core/shared/failures/register_errors.dart';

import '../../../../../../core/shared/failures/exceptions.dart';
import '../../../../../../core/shared/failures/i_app_exception.dart';
import '../../../../../../core/shared/services/auth/i_auth_service.dart';
import '../../../../../../core/types/either.dart';
import '../../domain/repositories/i_register_repository.dart';
import '../datasources/i_register_datasource.dart';

class RegisterRepositoryImpl extends IRegisterRepository {
  final IRegisterDatasource registerDatasource;

  RegisterRepositoryImpl(this.registerDatasource);

  @override
  Future<Either<IAppException, Unit>> call(
      RegisterWithEmailParam params) async {
    try {
      await registerDatasource.registerWithEmail(params);
    } on EmailError {
      return left(EmailError());
    } on PasswordError {
      return left(PasswordError());
    } catch (e, s) {
      return left(AuthException(message: e.toString(), stackTrace: s));
    }
    return right(unit);
  }
}
