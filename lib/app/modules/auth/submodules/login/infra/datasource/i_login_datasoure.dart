import '../../../../../../core/types/either.dart';
import '../../domain/types/params.dart';

abstract class ILoginDatasouce {
  Future<Unit> call(LoginEmailParams params);
}
