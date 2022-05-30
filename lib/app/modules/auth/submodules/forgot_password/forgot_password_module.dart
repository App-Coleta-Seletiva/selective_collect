import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/shared/services/auth/i_auth_service.dart';
import 'domain/usecases/forgot_password_usecase_impl.dart';
import 'infra/repositories/forgot_password_reporitory.dart';
import 'presenter/ui/bloc/forgot_password_bloc.dart';
import 'presenter/ui/pages/forgot_password_page.dart';

class ForgotPasswordModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind((i) => ForgotPasswordRepositoryImpl(service: i<IAuthService>())),
        Bind((i) => ForgotPasswordUsecaseImpl(repository: i())),
        Bind((i) => ForgotPasswordBloc(i<ForgotPasswordUsecaseImpl>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (ctx, args) => const ForgotPasswordPage()),
      ];
}
