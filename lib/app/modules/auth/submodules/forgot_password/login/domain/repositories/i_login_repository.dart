import 'package:fpdart/fpdart.dart';
import '../../../../../../../core/shared/failures/i_app_exception.dart';
import '../types/params.dart';

abstract class ILoginRepository {
  Future<Either<IAppException, Unit>> call(LoginEmailParams params);
}
