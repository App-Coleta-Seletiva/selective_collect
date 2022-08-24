import '../../../../../../core/shared/value_objects/login_parameters_type.dart';
import '../../../../../../core/types/either.dart';
import '../exceptions/login_exceptions.dart';
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

    return await _repository.login(params);
  }
}
