import '../../../../../../../core/shared/failures/exceptions.dart';
import '../../../../../../../core/types/either.dart';
import '../../infra/datasource/i_login_datasoure.dart';

import 'i_login_repository.dart';
import '../types/params.dart';

class LoginRepository implements ILoginRepository {
  final ILoginDatasouce _datasource;

  LoginRepository(this._datasource);

  @override
  Future<Either<AuthException, Unit>> call(LoginEmailParams params) async {
    // try {
    //   await _datasouce(params);
    //   return const Right(unit);
    // } on AuthException catch (e) {
    //   return Left(e);
    // } catch (e, s) {
    //   return Left(AuthException(message: e.toString(), stackTrace: s));
    // }

    try {
      await _datasource(params);
      return right(unit);
    } on AuthException catch (e, s) {
      return left(
        AuthException(
          message: e.toString(),
          stackTrace: s,
        ),
      );
    } catch (e) {
      return left(
        AuthException(
          message: e.toString(),
          stackTrace: StackTrace.empty,
        ),
      );
    }
  }
}
