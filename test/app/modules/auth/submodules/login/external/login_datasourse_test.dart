import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:selective_collect/app/core/shared/services/auth/i_auth_service.dart';

import 'package:selective_collect/app/modules/auth/submodules/login/domain/types/params_type.dart';
import 'package:selective_collect/app/modules/auth/submodules/login/external/login_datasourse.dart';

import '../../../../../mock/mock.dart';

void main() {
  late IAuthService service;

  setUp(() {
    service = IAuthServiceMock();
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
    final loginDatasourse = LoginDatasourse(service);
    //Expect
    expect(() => loginDatasourse.loginDatasourse(paramType), isA<dynamic>());
  });

  // test('Must complete Logout', () async {
  //   when(() => service .logout()).thenAnswer((_) => Future.value());

  //   expect(logoutUsecase(), completes);
  // });
}
