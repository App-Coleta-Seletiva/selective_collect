import '../../../../../../core/types/either.dart';

import '../../domain/types/params_type.dart';

abstract class ILoginDatasource {
  Future<Unit> loginDatasource(LoginEmailParamsType params);
  dynamic getCurrentUserDatasource();
  Future<dynamic> logout();
}
