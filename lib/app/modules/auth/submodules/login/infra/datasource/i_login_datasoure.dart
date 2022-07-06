import '../../domain/types/params_type.dart';

abstract class ILoginDatasource {
  Future<dynamic> loginDatasourse(LoginEmailParamsType params);

  Future<dynamic> logout();
}
