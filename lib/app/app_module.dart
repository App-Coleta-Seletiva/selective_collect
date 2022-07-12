import 'package:flutter_modular/flutter_modular.dart';
import 'package:selective_collect/app/modules/auth/auth_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];
//test
  @override
  final List<ModularRoute> routes = [
    ModuleRoute("/auth", module: AuthModule()),
    ModuleRoute(Modular.initialRoute, module: AuthModule()),
  ];
}
