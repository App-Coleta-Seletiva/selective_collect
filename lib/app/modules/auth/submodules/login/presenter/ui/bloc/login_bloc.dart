import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/i_login_usecase.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ILoginUsecase loginUsecase;
  LoginBloc(this.loginUsecase) : super(LoginInitial()) {
    on<NewLoginEvent>(_loginEvent);
  }

  Future<void> _loginEvent(
      NewLoginEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    final credentials = await loginUsecase(event.params);
    credentials.fold(
      (l) => emit(LoginError(l)),
      (r) => emit(LoginSuccess(event.params)),
    );
  }
}
