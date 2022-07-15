import 'package:flutter_modular/flutter_modular.dart';

import 'domain/repositories/login_repository.dart';
import 'domain/usecases/login_usecase.dart';
import 'external/login_datasource.dart';
import 'presenter/ui/bloc/login_bloc.dart';
import 'presenter/ui/pages/home.dart';
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
    ChildRoute('/home_page_login', child: (context, args) => const HomeLogin()),
  ];
}
