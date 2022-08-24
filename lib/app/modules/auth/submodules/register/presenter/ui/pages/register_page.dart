import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../../../core/shared/services/auth/i_auth_service.dart';
import '../bloc/register_bloc.dart';
import '../bloc/register_event.dart';
import '../bloc/register_states.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final RegisterBloc bloc;
  late final FirebaseAuth auth;
  late final TextEditingController email;
  late final TextEditingController password;

  @override
  void initState() {
    super.initState();
    auth = FirebaseAuth.instance;
    bloc = Modular.get<RegisterBloc>();
    email = TextEditingController();
    password = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Register'),
        ),
        body: Center(
          child: BlocBuilder<RegisterBloc, RegisterState>(
            bloc: bloc,
            builder: ((context, state) {
              if (state is LoadingRegisterState) {
                return const CircularProgressIndicator();
              }
              if (state is SuccessRegisterState) {
                return const Text('Success');
              }
              if (state is ExceptionRegisterState) {
                return Text(state.exception.message);
              }

              if (state is InitialRegisterState) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        label: Text('E-mail'),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                    TextFormField(
                      controller: password,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
                      decoration: const InputDecoration(
                        label: Text('Senha'),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                    TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        label: Text('Confirmar Senha'),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      width: double.infinity,
                      height: 70,
                      child: ElevatedButton(
                          onPressed: () {
                            bloc.add(RegisterUser(RegisterWithEmailParam(
                                email: email.text, password: password.text)));
                          },
                          child: const Text(
                            'Salvar Registro',
                          )),
                    )
                  ],
                );
              }
              return const Text('outro estado');
            }),
          ),
        ));
  }
}
