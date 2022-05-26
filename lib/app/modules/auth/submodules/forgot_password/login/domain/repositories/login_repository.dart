import 'package:fpdart/fpdart.dart';
import '../../infra/datasource/i_login_datasoure.dart';

import '../../../../../../../core/shared/failures/i_app_exception.dart';
import 'i_login_repository.dart';
import '../types/params.dart';

class LoginRepository implements ILoginRepository {
  final ILoginDatasouce _datasouce;

  LoginRepository(this._datasouce);

  @override
  Future<Either<IAppException, Unit>> call(LoginEmailParams params) async {
    try {
      await _datasouce(params);
      return const Right(unit);
    } on IAppException catch (e) {
      return Left(e);
    }
  }
}
