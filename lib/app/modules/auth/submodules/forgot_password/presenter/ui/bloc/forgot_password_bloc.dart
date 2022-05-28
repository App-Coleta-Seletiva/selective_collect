import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../../../core/shared/failures/forgot_password_failure.dart';
import '../../../domain/usecases/i_forgot_password_usecase.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final IForgotPasswordUsecase usecase;

  ForgotPasswordBloc(this.usecase) : super(ForgotPasswordInitial()) {
    on<RecoverPasswordEvent>(recoverPassword);
  }

  void recoverPassword(
      RecoverPasswordEvent event, Emitter<ForgotPasswordState> emit) async {
    emit(ForgotPasswordLoading());

    final result = await usecase(event.email);
    result.fold(
      (err) => {
        emit(ForgotPasswordError(failure: err as IAppFailure)),
      },
      (sucess) => {
        emit(ForgotPasswordSucess()),
      },
    );
  }
}
