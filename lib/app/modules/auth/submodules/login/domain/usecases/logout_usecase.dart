import '../exceptions/login_exceptions.dart';

import '../repositories/i_login_repository.dart';
import 'i_logout_usecase.dart';



class LogoutUsecase implements ILogoutUsecase {
  final ILoginRepository _loginRepository;

  LogoutUsecase(this._loginRepository);

  @override
  Future<void> call() async {
    try {
      _loginRepository.logout();
    } on ILoginException catch (e) {
      throw LoginException(
        message: e.message,
        stackTrace: e.stackTrace,
      );
    }
  }
}
