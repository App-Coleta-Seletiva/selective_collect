import 'package:selective_collect/app/modules/auth/submodules/login/exeptions/login_exeptions.dart';

import '../../../../../../core/shared/value_objects/login_parameters_type.dart';
import '../../../../../../core/types/either.dart';
import '../repositories/i_login_repository.dart';
import '../types/params_type.dart';
import 'i_login_usecase.dart';

class LoginUsecase implements ILoginUsecase {
  final ILoginRepository _repository;
  LoginUsecase(this._repository);

  @override
  Future<Either<ILoginException, Unit>> call(
      LoginEmailParamsType params) async {
    if (!LoginParametersType.isEmpty(params.email, params.password)) {
      return left(
        LoginException(
          message: 'Verifique os dados inseridos',
          stackTrace: StackTrace.current,
        ),
      );
    }
    if (!LoginParametersType.validateEmail(params.email)) {
      return left(
        LoginException(
          message: 'Deve conter @',
          stackTrace: StackTrace.current,
        ),
      );
    }
    if (!LoginParametersType.validatePassword(params.password)) {
      return left(
        LoginException(
          message: 'Senha deve conter mais de 8 Caracteres',
          stackTrace: StackTrace.current,
        ),
      );
    }
    try {
      return await _repository.login(params);
    } catch (e) {
      return left(
        LoginException(
          message: 'Senha deve conter mais de 8 Caracteres',
          stackTrace: StackTrace.current,
        ),
      );
    }
  }
}
