import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:selective_collect/app/core/shared/services/auth/i_auth_service.dart';

import 'package:selective_collect/app/modules/auth/submodules/login/domain/types/params_type.dart';
import 'package:selective_collect/app/modules/auth/submodules/login/external/login_datasource.dart';
import 'package:selective_collect/app/modules/auth/submodules/login/infra/datasource/i_login_datasource.dart';

import '../../../../../mock/mock.dart';

void main() {
  late IAuthService service;
  late ILoginDatasource loginDatasource;

  setUp(() {
    service = IAuthServiceMock();
    loginDatasource = LoginDatasource(service);
  });
  test('should return a dynamic ...', () async {
    //Arrange
    final paramType =
        LoginEmailParamsType(email: 'meu@email', password: '12345678');
    final params =
        LoginWithEmailParam(email: paramType.email, password: paramType.email);

    when(() => service.loginWithEmail(params))
        .thenAnswer((_) => Future.value());

    //ACT

    //Expect
    expect(() => loginDatasource.loginDatasource(paramType), isA<dynamic>());
  });

  test('Must complete Logout Datasource', () async {
    when(() => service.logout()).thenAnswer((_) => Future.value());

    expect(loginDatasource.logout(), completes);
  });
}
