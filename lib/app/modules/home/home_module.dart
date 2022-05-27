import 'package:flutter_modular/flutter_modular.dart';
import 'package:selective_collect/app/modules/home/presenter/ui/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (context, args) => const HomePage()),
      ];
}
