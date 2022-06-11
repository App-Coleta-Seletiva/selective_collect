
import '../../domain/types/params_type.dart';

abstract class ILoginDatasouce {
  Future<dynamic> call(LoginEmailParamsType params);
}
