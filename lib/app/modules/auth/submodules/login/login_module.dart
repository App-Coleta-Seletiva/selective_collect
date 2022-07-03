import 'package:flutter_modular/flutter_modular.dart';
import 'domain/repositories/login_repository.dart';
import 'domain/usecases/login_usecase.dart';
import 'external/login_datasourse.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => LoginDatasourse(i())),
    Bind.factory((i) => LoginRepository(i())),
    Bind.factory((i) => LoginUsecase(i()))
  ];

  @override
  final List<ModularRoute> routes = [];
}
