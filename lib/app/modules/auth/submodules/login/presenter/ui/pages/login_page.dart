import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../domain/types/params_type.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginBloc loginBloc;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loginBloc = Modular.get<LoginBloc>();
  }

  @override
  void dispose() {
    if (!loginBloc.isClosed) {
      loginBloc.close();
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
                bloc: loginBloc,
                builder: (_, state) {
                  if (state is LoginError) {
                    showSnackBar(state.exception.message);
                    // print(state.exception.message);
                    // print(state.exception.stackTrace);
                  }
                  if (state is LoginSuccess) {
                    Modular.to.pushReplacementNamed('/home');
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
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    final params = LoginEmailParamsType(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                    loginBloc.add(NewLoginEvent(params));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                    elevation: 7,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12.0,
                                      vertical: 10,
                                    ),
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        wordSpacing: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    elevation: 0,
                                    primary: Colors.black.withOpacity(0.2),
                                    shadowColor: Colors.transparent,
                                    side: const BorderSide(
                                      width: 2,
                                      color: Colors.green,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    enableFeedback: false,
                                    visualDensity: VisualDensity.compact,
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    child: Text(
                                      'Cadastre-se',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        wordSpacing: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const CustomTextFormField(
      {Key? key, required this.controller, required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
        decoration: InputDecoration(
          fillColor: Colors.black.withOpacity(0.2),
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.white, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.white, width: 3),
          ),
        ),
      ),
    );
  }
}
