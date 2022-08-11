import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth/submodules/login/domain/usecases/i_get_current_user_usecase.dart';

import 'event/current_user_event.dart';
import 'state/current_user_state.dart';

class CurrentUserBloc extends Bloc<CheckCurrentUserEvent, CurrentUserState> {
  final IGetCurrentuserUsecase _currentuserUsecase;

  CurrentUserBloc(this._currentuserUsecase) : super(CurrentUserInitial()) {
    on<CheckCurrentUserEvent>(_checkUserEvent);
  }
  Future<void> _checkUserEvent(
      CheckCurrentUserEvent event, Emitter<CurrentUserState> emit) async {
    emit(CurrentUserLoading());

    final result = _currentuserUsecase();

    result.fold(
      (l) => emit(CurrentUserError(l)),
      (r) {
        // final currentModel = r as CurrentUserModel;
        emit(CurrentUserSuccess(currentUserModel: r));
      },
    );
  }
}
