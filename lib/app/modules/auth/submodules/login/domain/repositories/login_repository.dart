import 'package:selective_collect/app/core/shared/failures/exceptions.dart';

import '../../../../../../core/types/either.dart';
import '../../exceptions/login_exceptions.dart';
import '../../infra/datasource/i_login_datasource.dart';
import '../types/params_type.dart';
import 'i_login_repository.dart';

class LoginRepository implements ILoginRepository {
  final ILoginDatasource _datasource;

  LoginRepository(this._datasource);

  @override
  Future<Either<ILoginException, Unit>> login(
      LoginEmailParamsType params) async {
    try {
      final result = await _datasource.loginDatasource(params);
      if (result is AuthException) {
        return left(
          LoginException(
            message: result.message,
            stackTrace: result.stackTrace,
          ),
        );
      }
      return right(unit);
    } on AuthException catch (e, s) {
      return left(
        LoginException(
          message: e.message,
          stackTrace: s,
        ),
      );
    }
  }

  @override
  Future<void> logout() async {
    await _datasource.logout();
  }
}
