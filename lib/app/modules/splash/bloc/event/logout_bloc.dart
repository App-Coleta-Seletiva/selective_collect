import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/submodules/login/domain/usecases/i_get_current_user_usecase.dart';
import '../logout_event.dart';
import '../state/logout_state.dart';

class CheckCurrentUserBloc
    extends Bloc<CheckCurrentUserEvent, CheckCurrentUserState> {
  final IGetCurrentuserUsecase _currentuserUsecase;

  CheckCurrentUserBloc(this._currentuserUsecase)
      : super(CheckCurrentUserInitial()) {
    on<CheckCurrentUserEvent>(_checkUserEvent);
  }
  Future<void> _checkUserEvent(
      CheckCurrentUserEvent event, Emitter<CheckCurrentUserState> emit) async {
    emit(CheckCurrentUserLoading());

    final result = _currentuserUsecase();

    result.fold(
      (l) => CheckCurrentUserError(l),
      (r) => CheckCurrentUserSuccess(),
    );
  }
}
