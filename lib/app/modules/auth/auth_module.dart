import 'package:flutter_modular/flutter_modular.dart';
import 'submodules/register/register_module.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: RegisterModule()),
    ModuleRoute("/register", module: RegisterModule()),
  ];
}
