import '../../../../../../core/shared/failures/i_app_exception.dart';
import '../../../../../../core/shared/failures/register_errors.dart';
import '../../../../../../core/shared/services/auth/i_auth_service.dart';
import '../../../../../../core/types/either.dart';
import '../../domain/repositories/i_register_repository.dart';
import '../datasources/i_register_datasource.dart';

class RegisterRepositoryImpl extends IRegisterRepository {
  final IRegisterDatasource registerDatasource;

  RegisterRepositoryImpl(this.registerDatasource);

  @override
  Future<Either<IAppException, Unit>> call(
      RegisterWithEmailParam params) async {
    final result = await registerDatasource.registerWithEmail(params);
    late IAppException exception;
    if (result.isLeft) {
      result.fold((l) {
        exception = RegisterError(message: l.message);
      }, (r) => null);
      return left(exception);
    } else {
      return right(unit);
    }
  }
}
