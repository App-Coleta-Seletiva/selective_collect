import 'package:flutter_modular/flutter_modular.dart';
import 'submodules/login/login_module.dart';
import "submodules/register/register_module.dart";

class AuthModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LoginModule()),
    ModuleRoute('/login_module', module: LoginModule()),
    ModuleRoute('/register_module', module: RegisterModule()),
    // ModuleRoute("/forgot_password_module", module: ForgotPasswordModule()),
  ];
}
