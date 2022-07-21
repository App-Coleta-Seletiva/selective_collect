import '../../auth/submodules/login/domain/usecases/i_get_current_user_usecase.dart';

abstract class CheckCurrentUserEvent {}

class CheckUserEvent extends CheckCurrentUserEvent {
  final IGetCurrentuserUsecase getCurrentuserUsecase;

  CheckUserEvent(this.getCurrentuserUsecase);
}
