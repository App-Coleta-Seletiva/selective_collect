import 'package:flutter_modular/flutter_modular.dart';
import 'package:selective_collect/app/modules/auth/submodules/login/login_module.dart';
import 'submodules/register/register_module.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LoginModule()),
    ModuleRoute("/login", module: LoginModule()),
    ModuleRoute(Modular.initialRoute, module: RegisterModule()),
  ];
}
