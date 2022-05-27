import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:selective_collect/app/core/shared/failures/exceptions.dart';
import 'package:selective_collect/app/core/shared/failures/i_app_exception.dart';
import 'package:selective_collect/app/modules/auth/submodules/forgot_password/login/domain/repositories/i_login_repository.dart';
import 'package:selective_collect/app/modules/auth/submodules/forgot_password/login/domain/repositories/login_repository.dart';
import 'package:selective_collect/app/modules/auth/submodules/forgot_password/login/domain/types/params.dart';
import 'package:selective_collect/app/modules/auth/submodules/forgot_password/login/infra/datasource/i_login_datasoure.dart';

import '../../../../../../../mock/mock.dart';

void main() {
  late ILoginDatasouce datasouce;

  late ILoginRepository repository;

  setUp(() {
    datasouce = LoginDatasourseMock();
    repository = LoginRepository(datasouce);
  });

  test('Deve retornar um objeto Unit', () async {
    //Arrange
    final params = LoginEmailParamsMock();
    when(() => datasouce.call(params))
        .thenAnswer((_) async => Right(UnitMock()));

    //ACT
    final result = await repository(params);

    //EXPECT
    expect(result.fold((l) => l, (r) => r), isA<Unit>());
  });

  test('Deve retornar um AppExeption', () async {
    //Arrange
    final params = LoginEmailParamsMock();
    final appExepion = AppExceptionMock();

    when(() => datasouce.call(params)).thenThrow((_) =>
        const Left(AuthException(message: 'De erro meu fi', stackTrace: null)));

    //ACT
    final result = await repository(params);

    //EXPECT
    expect(
        result.fold((l) {
          l.message;
          return l.message;
        }, (r) => r),
        isA<AuthException>());
  });
}
