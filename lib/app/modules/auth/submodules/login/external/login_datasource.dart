import '../../../../../core/shared/services/auth/i_auth_service.dart';
import '../domain/types/params_type.dart';
import '../infra/datasource/i_login_datasource.dart';

class LoginDatasource implements ILoginDatasource {
  final IAuthService _authService;

  LoginDatasource(IAuthService authService) : _authService = authService;

  @override
  Future<dynamic> loginDatasource(LoginEmailParamsType params) async {
    final serviceParam = LoginWithEmailParam(
      email: params.email,
      password: params.password,
    );

    return await _authService.loginWithEmail(serviceParam);
  }

  @override
  Future<dynamic> logout() async {
    return await _authService.logout();
  }
}
