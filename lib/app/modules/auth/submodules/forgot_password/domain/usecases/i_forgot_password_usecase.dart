import 'package:fpdart/fpdart.dart';
import '../../../../../../core/shared/failures/i_app_exception.dart';

abstract class IForgotPassword {
  Future<Either<IAppException, bool>> call();
}
