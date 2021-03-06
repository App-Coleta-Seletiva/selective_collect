import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:selective_collect/app/core/shared/failures/exceptions.dart';
import 'package:selective_collect/app/core/types/either.dart';
import 'package:selective_collect/app/modules/auth/submodules/login/domain/repositories/i_login_repository.dart';
import 'package:selective_collect/app/modules/auth/submodules/login/domain/types/params.dart';
import 'package:selective_collect/app/modules/auth/submodules/login/domain/usecases/i_login_usecase.dart';
import 'package:selective_collect/app/modules/auth/submodules/login/domain/usecases/login_usecase.dart';

import '../../../../../../mock/mock.dart';

void main() {
  late ILoginUsecase loginUsecase;

  late ILoginRepository repository;

  final params =
      LoginEmailParams(email: 'teste123@gmail.com', password: '12345678');

  setUp(() {
    repository = RepositoryMock();
    loginUsecase = LoginUsecase(repository);
  });

  test('Must complete the call to login usecase', () async {
    //Arrange
    final unit = UnitMock();

    when(() => repository.login(params)).thenAnswer(
      (_) async => right(unit),
    );

    //ACT

    //Expect
    expect(loginUsecase(params), completes);
  });

  test('Should return AuthExeption if email does not contain @', () async {
    //Arrange
    final paramsError =
        LoginEmailParams(email: 'teste123gmail.com', password: '12345678');
    //ACT

    //Expect
    expect(loginUsecase(paramsError), throwsA(isA<AuthException>()));
  });

  test('Should return AuthExeption if password is less than 8', () async {
    //Arrange
    final paramsError =
        LoginEmailParams(email: 'teste123@gmail.com', password: '5678');
    //ACT

    //Expect
    expect(loginUsecase(paramsError), throwsA(isA<AuthException>()));
  });
}
