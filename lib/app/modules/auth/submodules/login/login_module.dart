import 'package:flutter_modular/flutter_modular.dart';
import 'presenter/ui/pages/home.dart';
import 'presenter/ui/pages/login_page.dart';

import 'domain/repositories/login_repository.dart';
import 'domain/usecases/login_usecase.dart';
import 'external/login_datasource.dart';
import 'presenter/ui/bloc/login_bloc.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => LoginDatasource(i())),
    Bind.factory((i) => LoginRepository(i())),
    Bind.factory((i) => LoginUsecase(i())),
    Bind((i) => LoginBloc(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (ctx, args) => const LoginPage()),
    ChildRoute('/home', child: (context, args) => const HomeLogin()),
  ];
}
