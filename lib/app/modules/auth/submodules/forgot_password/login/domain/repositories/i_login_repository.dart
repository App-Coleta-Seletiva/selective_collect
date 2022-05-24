import 'package:fpdart/fpdart.dart';
import 'package:selective_collect/app/core/shared/failures/i_app_exception.dart';
import 'package:selective_collect/app/modules/auth/submodules/forgot_password/login/domain/entities/login_entity.dart';
import 'package:selective_collect/app/modules/auth/submodules/forgot_password/login/domain/types/params.dart';

abstract class ILoginRepository {
  Future<Either<IAppException, LoginEntity>> call(LoginEmailParams params);
}
