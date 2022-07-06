import '../../domain/types/params_type.dart';

abstract class ILoginDatasouce {
  Future<dynamic> loginDatasourse(LoginEmailParamsType params);

  Future<dynamic> logout();
}
