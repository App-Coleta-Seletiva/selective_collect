import 'package:selective_collect/app/core/shared/failures/register_errors.dart';

import '../../../../../../core/shared/failures/i_app_exception.dart';

import '../../../../../../core/types/either.dart';
import '../repositories/i_register_repository.dart';
import '../types/register_params.dart';
import 'i_register_usecase.dart';

class RegisterUsecaseImpl implements IRegisterUsecase {
  final IRegisterRepository repository;

  RegisterUsecaseImpl(this.repository);

  @override
  Future<Either<IAppException, Unit>> call(RegisterParams params) async {
    if (params.email.isEmpty) {
      return left(const EmailError());
    }

    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(params.email)) {
      return left(const EmailError());
    }
    if (params.email.length < 8) {
      return left(const PasswordError());
    }

    return repository(params);
  }
}
