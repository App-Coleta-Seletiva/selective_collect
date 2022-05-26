import 'package:fpdart/fpdart.dart';
import '../types/params.dart';
import '../../../../../../../core/shared/failures/i_app_exception.dart';

abstract class ILoginUsecase {
  Future<Either<IAppException, Unit>> call(LoginEmailParams params);
}
