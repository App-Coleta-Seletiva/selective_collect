import 'package:flutter_modular/flutter_modular.dart';
import 'package:selective_collect/app/modules/auth/submodules/login/login_module.dart';
import 'package:selective_collect/app/modules/auth/submodules/register/register_module.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LoginModule()),
    ModuleRoute("/login_module", module: LoginModule()),
    ModuleRoute("/register_module", module: RegisterModule()),
    // ModuleRoute("/forgot_password_module", module: ForgotPasswordModule()),
  ];
}
