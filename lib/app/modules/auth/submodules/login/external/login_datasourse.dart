import '../../../../../core/shared/services/auth/i_auth_service.dart';
import '../../../../../core/types/either.dart';
import '../domain/types/params.dart';
import '../infra/datasource/i_login_datasoure.dart';

class LoginDatasourse implements ILoginDatasouce {
  final IAuthService _authService;

  LoginDatasourse(IAuthService authService) : _authService = authService;

  @override
  Future<Unit> call(LoginEmailParams params) async {
    final serviceParam =
        LoginWithEmailParam(email: params.email, password: params.password);

    await _authService.loginWithEmail(serviceParam);
    return unit;
  }
}
