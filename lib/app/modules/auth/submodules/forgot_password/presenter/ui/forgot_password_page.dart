import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'bloc/forgot_password_bloc.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final textControllerEmail = TextEditingController();
  late final ForgotPasswordBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<ForgotPasswordBloc>();
  }

  message(String message) {
    Future.delayed(const Duration(microseconds: 300), () {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message, textAlign: TextAlign.center)),
      );
    });
  }

  @override
  void dispose() {
    if (!bloc.isClosed) {
      bloc.close();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Recuperar a senha")),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: textControllerEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  label: Text("Informe seu e-mail"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                ),
              ),
              BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                bloc: bloc,
                builder: (context, state) {
                  if (state is ForgotPasswordError) {
                    message(state.failure.message);
                  }
                  return (state is ForgotPasswordLoading)
                      ? ElevatedButton(
                          child: const CircularProgressIndicator(),
                          onPressed: () {},
                        )
                      : ElevatedButton(
                          child: const Text("Solicitar nova senha"),
                          onPressed: () {
                            bloc.add(
                              RecoverPasswordEvent(
                                  email: textControllerEmail.text),
                            );
                          },
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
