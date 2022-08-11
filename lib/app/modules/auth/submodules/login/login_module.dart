import 'package:flutter_modular/flutter_modular.dart';
import '../../../home/presenter/ui/home_page.dart';
import '../register/register_module.dart';

import 'domain/repositories/login_repository.dart';
import 'domain/usecases/login_usecase.dart';
import 'external/login_datasource.dart';
import 'presenter/ui/bloc/login_bloc.dart';
import 'presenter/ui/pages/login_page.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => LoginDatasource(i())),
    Bind((i) => LoginRepository(i())),
    Bind((i) => LoginUsecase(i())),
    Bind((i) => LoginBloc(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (ctx, args) => const LoginPage()),
    ChildRoute('/home_page', child: (context, args) => const HomePage()),
    ModuleRoute('/register_module', module: RegisterModule()),
  ];
}
