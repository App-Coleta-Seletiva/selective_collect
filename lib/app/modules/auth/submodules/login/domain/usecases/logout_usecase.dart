import '../../../../../../core/shared/failures/i_app_exception.dart';
import '../repositories/i_login_repository.dart';
import 'i_logout_usecase.dart';

import '../../../../../../core/shared/failures/exceptions.dart';

class LogoutUsecase implements ILogoutUsecase {
  final ILoginRepository _loginRepository;

  LogoutUsecase(this._loginRepository);

  @override
  Future<void> call() async {
    try {
      _loginRepository.logout();
    } on IAppException catch (e) {
      throw AuthException(
        message: e.message,
        stackTrace: e.stackTrace,
      );
    }
  }
}
