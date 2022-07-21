import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:selective_collect/app/core/shared/services/auth/i_auth_service.dart';
import 'package:selective_collect/app/core/types/either.dart';
import 'package:selective_collect/app/modules/auth/submodules/login/domain/entities/login_entity.dart';
import 'package:selective_collect/app/modules/auth/submodules/login/domain/repositories/i_login_repository.dart';
import 'package:selective_collect/app/modules/auth/submodules/login/domain/repositories/login_repository.dart';
import 'package:selective_collect/app/modules/auth/submodules/login/infra/datasource/i_login_datasource.dart';

import '../../../../../../mock/mock.dart';

void main() {
  late ILoginDatasource datasouce;

  late ILoginRepository repository;

  setUp(() {
    datasouce = LoginDatasourceMock();
    repository = LoginRepository(datasouce);
  });

  test('Must return a Unit object', () async {
    //Arrange
    final params = LoginEmailParamsMock();
    when(() => datasouce.loginDatasource(params))
        .thenAnswer((_) async => UnitMock());

    //ACT
    final result = await repository.login(params);

    //EXPECT
    expect(result.fold((l) => l, (r) => r), isA<Unit>());
  });

  test('Must return a loginEntity when calling repository', () async {
    //Arrange
    final userEntityService = UserEntityService('007@qualquercoisa.com');
    when(() => datasouce.getCurrentUserDatasource())
        .thenAnswer((_) => userEntityService);

    //ACT
    final result = repository.getCurrentUser();

    //EXPECT
    expect(result.fold((l) => l, (r) => r), isA<LoginEntity>());
  });

/*   test('Should return an AppExeption', () async {
    //Arrange
    final params = LoginEmailParamsMock();

    when(() => datasouce.loginDatasource(params)).thenAnswer((_) async => UnitMock());

    //ACT
    final result = await repository.login(params);
    debugPrint('result.isLeft:');
    debugPrint(result.isLeft.toString());
    debugPrint('result.isRigth:');
    debugPrint(result.isRight.toString());

    //EXPECT
    expect(result.fold((l) => l, (r) => r), isA<Unit>());
  }); */
}
