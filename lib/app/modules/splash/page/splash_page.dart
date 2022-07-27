import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:selective_collect/app/modules/splash/bloc/current_user_bloc.dart';
import 'package:selective_collect/app/modules/splash/bloc/state/current_user_state.dart';

import '../bloc/event/current_user_event.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final currentBloc = Modular.get<CurrentUserBloc>();
  @override
  void initState() {
    super.initState();
    currentBloc.add(CheckCurrentUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 100;
    final height = MediaQuery.of(context).size.height / 100;
    return Scaffold(
      body: Column(children: [
        BlocBuilder<CurrentUserBloc, CurrentUserState>(
            bloc: currentBloc,
            builder: (_, state) {
              return Container(
                width: width * 100,
                height: height * 100,
                child: const Icon(Icons.label, color: Colors.white),
                color: Colors.green,
              );
            })
      ]),
    );
  }
}
