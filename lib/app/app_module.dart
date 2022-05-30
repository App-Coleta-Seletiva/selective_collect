import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/shared/services/auth/auth_service_firebase_impl.dart';
import 'core/shared/services/hasura_service/hasura_service.dart';
import 'modules/auth/auth_module.dart';
import 'modules/auth/guards/auth_guard.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => FirebaseAuth.instance),
    Bind((i) => FirebaseAuthService(i<FirebaseAuth>())),
    Bind((i) => HasuraService()),
  ];
//test
  @override
  final List<ModularRoute> routes = [
    ModuleRoute("/auth", module: AuthModule()),
    ModuleRoute(Modular.initialRoute,
        module: HomeModule(), guards: [AuthGuard()]),
  ];
}
