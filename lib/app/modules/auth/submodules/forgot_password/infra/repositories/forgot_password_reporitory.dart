import 'package:fpdart/fpdart.dart';
import 'package:selective_collect/app/modules/auth/submodules/forgot_password/domain/entities/forgot_password_entity.dart';
import 'package:selective_collect/app/modules/auth/submodules/forgot_password/domain/usecases/i_forgot_password_usecase.dart';

import '../../domain/repositories/i_forgot_password_reporitory.dart';
import '../datasource/i_datasource.dart';

class ForgotPasswordRepositoryImpl extends IForgotPasswordRepository {
  final IForgotPasswordUsecase usecase;
  final IDatasource datasource;

  ForgotPasswordRepositoryImpl({
    required this.usecase,
    required this.datasource,
  });

  @override
  Future<Either<Exception, bool>> call(
      ForgotPasswordEntity forgotPassword) async {
    var result = await usecase(forgotPassword);
    if (result is Exception) {
      return result;
    }
    //var email = result.fold
    return await datasource.recoveryPasswordByMail("");
  }
}
