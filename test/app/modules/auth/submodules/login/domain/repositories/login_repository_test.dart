import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:selective_collect/app/core/shared/failures/exceptions.dart';
import 'package:selective_collect/app/core/types/either.dart';
import 'package:selective_collect/app/modules/auth/submodules/login/domain/repositories/i_login_repository.dart';
import 'package:selective_collect/app/modules/auth/submodules/login/domain/repositories/login_repository.dart';
import 'package:selective_collect/app/modules/auth/submodules/login/exeptions/login_exeptions.dart';
import 'package:selective_collect/app/modules/auth/submodules/login/infra/datasource/i_login_datasoure.dart';

import '../../../../../../mock/mock.dart';

void main() {
  late ILoginDatasouce datasouce;

  late ILoginRepository repository;

  setUp(() {
    datasouce = LoginDatasourseMock();
    repository = LoginRepository(datasouce);
  });

  test('Must return a Unit object', () async {
    //Arrange
    final params = LoginEmailParamsMock();
    when(() => datasouce.loginDatasourse(params))
        .thenAnswer((_) async => UnitMock());

    //ACT
    final result = await repository.login(params);

    //EXPECT
    expect(result.fold((l) => l, (r) => r), isA<Unit>());
  });

  test('Should return an AppExeption', () async {
    //Arrange
    final params = LoginEmailParamsMock();

    when(() => datasouce.loginDatasourse(params)).thenThrow((_) => left(
        const LoginException(message: 'De erro meu fi', stackTrace: null)));

    //ACT
    final result = await repository.login(params);

    //EXPECT
    expect(result.fold((l) => l, (r) => r), isA<LoginException>());
  });
}
