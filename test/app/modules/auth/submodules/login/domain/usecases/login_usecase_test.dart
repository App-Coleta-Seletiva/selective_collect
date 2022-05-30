import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:selective_collect/app/core/shared/failures/errors.dart';
import 'package:selective_collect/app/core/types/either.dart';
import 'package:selective_collect/app/modules/auth/submodules/login/domain/repositories/i_login_repository.dart';
import 'package:selective_collect/app/modules/auth/submodules/login/domain/usecases/i_login_usecase.dart';
import 'package:selective_collect/app/modules/auth/submodules/login/domain/usecases/login_usecase.dart';

import '../../../../../../mock/mock.dart';

void main() {
  late ILoginUsecase loginUsecase;

  late ILoginRepository repository;

  setUp(() {
    repository = RepositoryMock();
    loginUsecase = LoginUsecase(repository);
  });

  test('Must complete the call to login usecase', () async {
    //Arrange
    final params = LoginEmailParamsMock();
    final unit = UnitMock();

    when(() => repository.call(params)).thenAnswer(
      (_) async => right(unit),
    );

    //ACT

    //Expect
    expect(loginUsecase(params), completes);
  });

  test('Must complete call and return exception', () async {
    final params = LoginEmailParamsMock();

    when(() => repository.call(params)).thenAnswer(
      (_) async => left(
        const PasswordError(
            message: 'error params', stackTrace: StackTrace.empty),
      ),
    );
    //ACT
    final result = await loginUsecase(params);

    //Expect
    expect(result.fold((l) => l, (r) => r), isA<PasswordError>());
  });
}
