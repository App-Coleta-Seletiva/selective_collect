import 'package:fpdart/fpdart.dart';

import '../../domain/repositories/i_forgot_password_reporitory.dart';
import '../datasource/i_datasource.dart';

class ForgotPasswordRepositoryImpl extends IForgotPasswordRepository {
  final IDatasource datasource;

  ForgotPasswordRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Exception, bool>> call(String email) async {
    try {
      var result = await datasource.recoveryPasswordByMail(email);
      return right(result);
    } catch (e) {
      return left(Exception(e));
    }
  }
}
