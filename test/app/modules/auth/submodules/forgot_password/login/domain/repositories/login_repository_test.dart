import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:selective_collect/app/core/shared/failures/exceptions.dart';
import 'package:selective_collect/app/core/types/either.dart';
import 'package:selective_collect/app/modules/auth/submodules/forgot_password/login/domain/repositories/i_login_repository.dart';
import 'package:selective_collect/app/modules/auth/submodules/forgot_password/login/domain/repositories/login_repository.dart';
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
    when(() => datasouce.call(params)).thenAnswer((_) async => UnitMock());

    //ACT
    final result = await repository(params);

    //EXPECT
    expect(result.fold((l) => l, (r) => r), isA<Unit>());
  });

  test('Deve retornar um AppExeption', () async {
    //Arrange
    final params = LoginEmailParamsMock();

    when(() => datasouce.call(params)).thenThrow((_) =>
        left(const AuthException(message: 'De erro meu fi', stackTrace: null)));

    //ACT
    final result = await repository(params);

    //EXPECT
    expect(result.fold((l) => l, (r) => r), isA<AuthException>());
    //expect(repository(params), completes);
  });
}
