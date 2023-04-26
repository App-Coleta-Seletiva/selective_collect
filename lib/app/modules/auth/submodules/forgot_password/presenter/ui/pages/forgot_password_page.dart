import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../bloc/forgot_password_bloc.dart';

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
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: SingleChildScrollView(
            child: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
              bloc: bloc,
              builder: (context, state) {
                if (state is ForgotPasswordError) {
                  textControllerEmail.selection;
                  message(state.failure.message);
                }
                if (state is ForgotPasswordSucess) {
                  message("Solicitação enviada com sucesso!");
                }
                return Column(
                  children: <Widget>[
                    TextFormField(
                      controller: textControllerEmail,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        label: Text("Informe seu e-mail"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                      ),
                      validator: (value) {
                        debugPrint(value);
                        return (state is ForgotPasswordError)
                            ? state.failure.message
                            : null;
                      },
                    ),
                    const SizedBox(width: 10, height: 10),
                    ButtonProgressWidget(
                        bloc: bloc, textControllerEmail: textControllerEmail),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonProgressWidget extends StatefulWidget {
  const ButtonProgressWidget({
    Key? key,
    required this.bloc,
    required this.textControllerEmail,
  }) : super(key: key);

  final ForgotPasswordBloc bloc;
  final TextEditingController textControllerEmail;

  @override
  State<ButtonProgressWidget> createState() => _ButtonProgressWidgetState();
}

class _ButtonProgressWidgetState extends State<ButtonProgressWidget> {
  VoidCallback? recover() {
    widget.bloc
        .add(RecoverPasswordEvent(email: widget.textControllerEmail.text));
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var isLoading = (widget.bloc.state is ForgotPasswordLoading);
    return GestureDetector(
      onTap: isLoading ? () {} : recover,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
        alignment: Alignment.center,
        width: isLoading ? 60 : 200,
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: isLoading
            ? CircularProgressIndicator(
                color: Theme.of(context).dialogBackgroundColor,
              )
            : Text(
                "Recuperar senha",
                softWrap: false,
                style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
      ),
    );
  }
}
