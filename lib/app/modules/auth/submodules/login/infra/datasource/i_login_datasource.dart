import 'package:selective_collect/app/core/types/either.dart';
import '../../domain/entities/login_entity.dart';

import '../../domain/types/params_type.dart';

abstract class ILoginDatasource {
  Future<Unit> loginDatasource(LoginEmailParamsType params);
LoginEntity getCurrentUserdatasource();
  Future<dynamic> logout();

}
