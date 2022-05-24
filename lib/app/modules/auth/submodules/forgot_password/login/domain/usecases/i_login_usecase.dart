import 'package:fpdart/fpdart.dart';
import 'package:selective_collect/app/modules/auth/submodules/forgot_password/login/domain/types/params.dart';
import '../../../../../../../core/shared/failures/i_app_exception.dart';
import '../entities/login_entity.dart';

abstract class ILoginUsecase {
  Future<Either<IAppException, LoginEntity>> call(LoginEmailParams params);
}
