import 'package:flutter_modular/flutter_modular.dart';
import 'controllers/splash_controller.dart';
import '../auth/submodules/login/domain/repositories/login_repository.dart';
import '../auth/submodules/login/domain/usecases/get_current_user._usecase.dart';
import '../auth/submodules/login/external/login_datasource.dart';
import 'bloc/current_user_bloc.dart';
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
    // ModuleRoute("/auth_module", module: AuthModule()),
    // ModuleRoute("/register_module", module: RegisterModule()),
  ];
}
