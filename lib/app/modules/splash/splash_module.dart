import 'package:flutter_modular/flutter_modular.dart';

import '../auth/auth_module.dart';
import '../auth/submodules/login/domain/repositories/login_repository.dart';
import '../auth/submodules/login/domain/usecases/get_current_user._usecase.dart';
import '../auth/submodules/login/external/login_datasource.dart';
import '../auth/submodules/register/register_module.dart';
import '../home/home_module.dart';
import '../home/presenter/ui/home_page.dart';
import 'bloc/current_user_bloc.dart';
import 'controllers/splash_controller.dart';
import 'page/splash_page.dart';

class SplashModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => LoginDatasource(i.get())),
    Bind((i) => LoginRepository(i.get())),
    Bind((i) => GetCurrentUser(i.get())),
    Bind((i) => CurrentUserBloc(i.get())),
    Bind((i) => SplashController(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (ctx, args) => const SplashPage()),
    ChildRoute('/home_page', child: (context, args) => const HomePage()),
    ModuleRoute('/home_module', module: HomeModule()),
    ModuleRoute('/auth_module', module: AuthModule()),
    ModuleRoute('/register_module', module: RegisterModule()),
    // ModuleRoute("/register_module", module: RegisterModule()),
  ];
}
