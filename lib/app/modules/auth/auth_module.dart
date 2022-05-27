import 'package:flutter_modular/flutter_modular.dart';

import 'submodules/forgot_password/presenter/forgot_password_module.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: ForgotPasswordModule()),
    ModuleRoute("/forgot_password", module: ForgotPasswordModule()),
  ];
}
