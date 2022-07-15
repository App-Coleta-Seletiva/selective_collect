import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/ui/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> routes = [
    ChildRoute('/home_page', child: (context, args) => const HomePage()),
  ];
}
