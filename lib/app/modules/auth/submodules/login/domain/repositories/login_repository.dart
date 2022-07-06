import '../../../../../../core/types/either.dart';
import '../../exeptions/login_exeptions.dart';
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
      await _datasource.loginDatasource(params);
      return right(unit);
    } on ILoginException catch (e, s) {
      return left(
        LoginException(
          message: e.toString(),
          stackTrace: s,
        ),
      );
    } catch (e) {
      return left(
        LoginException(
          message: e.toString(),
          stackTrace: StackTrace.empty,
        ),
      );
    }
  }

  @override
  Future<void> logout() async {
    await _datasource.logout();
  }
}
