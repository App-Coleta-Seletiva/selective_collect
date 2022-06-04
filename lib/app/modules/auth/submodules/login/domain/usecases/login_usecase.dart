import '../../../../../../core/shared/failures/exceptions.dart';
import '../../../../../../core/shared/value_objects/login_parameters_type.dart';

import '../../../../../../core/shared/failures/i_app_exception.dart';
import '../../../../../../core/types/either.dart';
import '../types/params.dart';
import 'i_login_usecase.dart';

import '../repositories/i_login_repository.dart';

class LoginUsecase implements ILoginUsecase {
  final ILoginRepository _repository;
  LoginUsecase(this._repository);

  @override
  Future<Either<IAppException, Unit>> call(LoginEmailParams params) async {
    try {
      LoginParametersType(email: params.email, password: params.password);
    } on AuthException catch (e) {
      throw AuthException(
          message: e.message.toString(), stackTrace: e.stackTrace);
    }
    return await _repository.login(params);
  }
}
