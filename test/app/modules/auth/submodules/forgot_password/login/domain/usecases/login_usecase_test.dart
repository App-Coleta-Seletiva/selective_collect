import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:selective_collect/app/modules/auth/submodules/forgot_password/login/domain/repositories/i_login_repository.dart';
import 'package:selective_collect/app/modules/auth/submodules/forgot_password/login/domain/usecases/i_login_usecase.dart';
import 'package:selective_collect/app/modules/auth/submodules/forgot_password/login/domain/usecases/login_usecase.dart';

import '../../../../../../../mock/mock.dart';

void main() {
  late ILoginUsecase loginUsecase;

  late ILoginRepository repository;

  setUp(() {
    repository = RepositoryMock();
    loginUsecase = LoginUsecase(repository);
  });

  test('must complete the call to login usecase', () async {
    //Arrange
    final params = LoginEmailParamsMock();
    final loginEntiry = LoginEntityMock();

    when(() => repository.call(params))
        .thenAnswer((_) async => Right(loginEntiry));

    //ACT

    //Expect
    expect(loginUsecase(params), completes);
  });
}
