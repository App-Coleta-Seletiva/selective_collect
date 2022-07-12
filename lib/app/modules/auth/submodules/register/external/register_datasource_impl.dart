import '../../../../../core/shared/failures/exceptions.dart';
import '../../../../../core/shared/failures/i_app_exception.dart';
import '../../../../../core/shared/failures/register_errors.dart';
import '../../../../../core/shared/services/auth/i_auth_service.dart';
import '../../../../../core/types/either.dart';
import '../infra/datasources/i_register_datasource.dart';

class RegisterDatasourceImpl extends IRegisterDatasource {
  final IAuthService _service;

  RegisterDatasourceImpl(this._service);

  @override
  Future<Either<IAppException, Unit>> registerWithEmail(
      RegisterWithEmailParam params) async {
    try {
      await _service.registerWithEmail(params);

      return right(unit);
    } on AuthException catch (e) {
      return left(RegisterError(message: e.message));
    }
  }
}
