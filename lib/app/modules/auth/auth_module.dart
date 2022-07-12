import 'package:flutter_modular/flutter_modular.dart';
import 'submodules/login/login_module.dart';


class AuthModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LoginModule()),
    ModuleRoute("/login", module: LoginModule()),
  ];
}