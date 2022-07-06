import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:selective_collect/app/modules/auth/submodules/login/domain/repositories/i_login_repository.dart';
import 'package:selective_collect/app/modules/auth/submodules/login/domain/usecases/i_logout_usecase.dart';
import 'package:selective_collect/app/modules/auth/submodules/login/domain/usecases/logout_usecase.dart';

import '../../../../../../mock/mock.dart';

void main() {
  late ILoginRepository loginRepository;
  late ILogoutUsecase logoutUsecase;

  setUp(() {
    loginRepository = RepositoryMock();
    logoutUsecase = LogoutUsecase(loginRepository);
  });

  test('Must complete Logout Usecase', () async {
    when(() => loginRepository.logout()).thenAnswer((_) => Future.value());

    expect(logoutUsecase(), completes);
  });
}
