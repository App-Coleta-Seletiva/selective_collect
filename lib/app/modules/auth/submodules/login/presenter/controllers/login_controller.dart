import 'package:flutter_modular/flutter_modular.dart';
import 'package:selective_collect/app/modules/auth/submodules/login/domain/types/params_type.dart';
import 'package:selective_collect/app/modules/auth/submodules/login/presenter/ui/bloc/login_event.dart';

import '../ui/bloc/login_bloc.dart';

class LoginController {
  late final LoginBloc loginBloc;

  LoginController() {
    loginBloc = Modular.get<LoginBloc>();
  }

  void login(String email, String password) {
    var credentials = LoginEmailParamsType(email: email, password: password);
    loginBloc.add(NewLoginEvent(credentials));
  }
}
