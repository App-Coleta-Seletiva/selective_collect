import 'package:selective_collect/app/core/shared/failures/i_app_exception.dart';
import 'package:selective_collect/app/core/shared/services/auth/i_auth_service.dart';
import 'package:selective_collect/app/core/types/either.dart';
import 'package:selective_collect/app/modules/auth/submodules/register/infra/datasources/i_register_datasource.dart';

import '../../../../../core/shared/failures/register_errors.dart';

class RegisterDatasourceImpl extends IRegisterDatasource {
  final IAuthService _service;

  RegisterDatasourceImpl(this._service);

  @override
  Future<Either<IAppException, bool>> registerWithEmail(
      RegisterWithEmailParam params) async {
    try {
      await _service.registerWithEmail(params);
    } catch (e, s) {
      left(RegisterError(message: e.toString(), stackTrace: s));
    }

    return right(true);
  }
}
