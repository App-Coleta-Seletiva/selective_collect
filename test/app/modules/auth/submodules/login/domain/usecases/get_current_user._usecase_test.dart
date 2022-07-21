import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:selective_collect/app/core/types/either.dart';
import 'package:selective_collect/app/modules/auth/submodules/login/domain/entities/login_entity.dart';
import 'package:selective_collect/app/modules/auth/submodules/login/domain/repositories/i_login_repository.dart';
import 'package:selective_collect/app/modules/auth/submodules/login/domain/usecases/get_current_user._usecase.dart';
import 'package:selective_collect/app/modules/auth/submodules/login/domain/usecases/i_get_current_user_usecase.dart';

import '../../../../../../mock/mock.dart';

void main() {
  late IGetCurrentuserUsecase getCurrentuserUsecase;

  late ILoginRepository repository;

  setUp(() {
    repository = RepositoryMock();
    getCurrentuserUsecase = GetCurrentUser(repository);
  });

  test('Must return a loginEntity', () async {
    //Arrange

    when(() => repository.getCurrentUser()).thenAnswer(
      (_) => right(LoginEntity(email: 'email@bol')),
    );

    //ACT
    final result = getCurrentuserUsecase();

    //Expect
    expect(result.fold((l) => l, (r) => r), isA<LoginEntity>());
  });
}
