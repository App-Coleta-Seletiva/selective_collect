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
    if (!LoginParametersType.validateEmail(params.email)) {
      return left(AuthException(
          message: 'Deve conter @', stackTrace: StackTrace.current));
    }
    if (!LoginParametersType.validatePassword(params.password)) {
      return left(AuthException(
          message: 'Senha deve conter mais de 8 Caracteres',
          stackTrace: StackTrace.current));
    }

    return await _repository.login(params);
  }
}
