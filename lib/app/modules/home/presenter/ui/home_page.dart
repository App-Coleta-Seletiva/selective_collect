import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../core/shared/services/auth/auth_service_firebase_impl.dart';
import '../../../auth/submodules/login/domain/repositories/login_repository.dart';
import '../../../auth/submodules/login/domain/usecases/logout_usecase.dart';
import '../../../auth/submodules/login/external/login_datasource.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final logout = LogoutUsecase(LoginRepository(
      LoginDatasource(FirebaseAuthService(FirebaseAuth.instance))));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          IconButton(
            onPressed: () async {
              await logout.call();
              Modular.to.pushReplacementNamed('/');
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: const Center(
        child: Text("Home Page"),
      ),
    );
  }
}
