import '../../../../../../core/shared/failures/i_app_exception.dart';
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
    return result;
  }
}
