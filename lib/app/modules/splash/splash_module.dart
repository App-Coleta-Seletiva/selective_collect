import 'package:flutter_modular/flutter_modular.dart';
import 'package:selective_collect/app/modules/auth/auth_module.dart';
import 'package:selective_collect/app/modules/splash/controllers/splash_controller.dart';
import '../auth/submodules/register/register_module.dart';
import 'bloc/current_user_bloc.dart';
import 'page/splash_page.dart';

class SplashModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => CurrentUserBloc(i.get())),
    Bind((i) => SplashController(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (ctx, args) => const SplashPage()),
    ModuleRoute("/auth_module", module: AuthModule()),
    ModuleRoute("/register_module", module: RegisterModule()),
  ];
}
