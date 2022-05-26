import 'package:fpdart/fpdart.dart';

import '../../../../../../../core/shared/failures/i_app_exception.dart';
import '../types/params.dart';
import 'i_login_usecase.dart';

import '../repositories/i_login_repository.dart';

class LoginUsecase implements ILoginUsecase {
  final ILoginRepository _repository;
  LoginUsecase(this._repository);

  @override
  Future<Either<IAppException, Unit>> call(LoginEmailParams params) async {
    return await _repository(params);
  }
}
