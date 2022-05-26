import 'package:fpdart/fpdart.dart';

import '../../../../../../core/shared/failures/forgot_password_failure.dart';
import '../../domain/repositories/i_forgot_password_reporitory.dart';
import '../datasource/i_datasource.dart';

class ForgotPasswordRepositoryImpl extends IForgotPasswordRepository {
  final IDatasource datasource;

  ForgotPasswordRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, bool>> call(String email) async {
    try {
      var result = await datasource.recoveryPasswordByMail(email);
      return result;
    } catch (e, s) {
      return left(IAppFailure(message: e.toString(), stackTrace: s));
    }
  }
}
