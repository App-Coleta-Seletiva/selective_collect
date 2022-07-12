import 'package:flutter_modular/flutter_modular.dart';
import 'package:selective_collect/app/modules/auth/submodules/register/presenter/ui/pages/register_page.dart';

class RegisterModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const RegisterPage()),
      ];
}
