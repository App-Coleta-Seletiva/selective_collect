import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../controllers/login_controller.dart';
import '../bloc/login_bloc.dart';
import '../bloc/state/login_state.dart';
import '../widgets/custom_elevated_butom.dart';
import '../widgets/custom_text_butom.dart';
import '../widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController loginController = LoginController();
  // late final LoginBloc loginBloc;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    if (!loginController.loginBloc.isClosed) {
      loginController.loginBloc.close();
    }
    super.dispose();
  }

  showSnackBar(String message) {
    Future.delayed(const Duration(milliseconds: 500), () {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                // Color.fromARGB(255, 78, 180, 62),

                Color(0xFF89FF76),
                Color(0xFF393939),
              ]),
          color: Colors.red,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextFormField(
                controller: emailController,
                hintText: 'E-Mail',
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: passwordController,
                hintText: 'Senha',
              ),
              BlocBuilder<LoginBloc, LoginState>(
                bloc: loginController.loginBloc,
                builder: (_, state) {
                  if (state is LoginError) {
                    showSnackBar(state.exception.message);
                    // print(state.exception.message);
                    // print(state.exception.stackTrace);
                  }
                  if (state is LoginSuccess) {
                    Modular.to.pushReplacementNamed('/home_page');
                    ScaffoldMessenger.of(context).clearSnackBars();
                  }
                  return Column(
                    children: [
                      Visibility(
                        visible: state is LoginLoading ? true : false,
                        child: const CircularProgressIndicator(),
                      ),
                      Visibility(
                        visible: state is LoginLoading ? false : true,
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomElevatedButom(
                                title: 'Login',
                                onPressed: () {
                                  loginController.login(emailController.text,
                                      passwordController.text);
                                },
                              ),
                              const SizedBox(width: 20),
                              CustomTextButom(
                                title: 'Cadastre-se',
                                onPressed: () {
                                  Modular.to.pushNamed('/register_module');
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              TextButton(
                onPressed: () {
                  // Modular.to.pushNamed('/forgot_password_module/');
                  print('Falta implementar Forgot');
                  ScaffoldMessenger.of(context).clearSnackBars();
                },
                child: const Text(
                  'Esqueci minha senha',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
