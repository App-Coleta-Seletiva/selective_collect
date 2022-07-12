import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selective_collect/app/core/shared/failures/register_errors.dart';
import 'package:selective_collect/app/modules/auth/submodules/register/domain/usecases/i_register_usecase.dart';
import 'package:selective_collect/app/modules/auth/submodules/register/presenter/ui/bloc/register_event.dart';
import 'package:selective_collect/app/modules/auth/submodules/register/presenter/ui/bloc/register_states.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final IRegisterUsecase register;

  RegisterBloc(this.register) : super(InitialRegisterState()) {
    on(_register);
  }

  Future<void> _register(RegisterUser event, emit) async {
    emit(LoadingRegisterState());
    final result = await register.call(event.params);
    result.fold(
      (l) => emit(ExceptionRegisterState(l as IErrosRegister)),
      (r) => emit(SuccessRegisterState()),
    );
  }
}
