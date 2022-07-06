import '../../domain/types/params_type.dart';

abstract class ILoginDatasource {
  Future<dynamic> loginDatasource(LoginEmailParamsType params);

  Future<dynamic> logout();
}
