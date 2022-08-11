import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:selective_collect/app/core/types/either.dart';
import 'package:selective_collect/app/modules/auth/submodules/login/domain/entities/login_entity.dart';
import 'package:selective_collect/app/modules/auth/submodules/login/domain/exceptions/login_exceptions.dart';
import 'package:selective_collect/app/modules/auth/submodules/login/domain/repositories/i_login_repository.dart';
import 'package:selective_collect/app/modules/auth/submodules/login/domain/usecases/get_current_user._usecase.dart';
import 'package:selective_collect/app/modules/auth/submodules/login/domain/usecases/i_get_current_user_usecase.dart';
import 'package:selective_collect/app/modules/splash/bloc/current_user_bloc.dart';
import 'package:selective_collect/app/modules/splash/bloc/event/current_user_event.dart';
import 'package:selective_collect/app/modules/splash/bloc/state/current_user_state.dart';

import '../../../mock/mock.dart';

void main() {
  late IGetCurrentuserUsecase getCurrentuserUsecase;
  late ILoginRepository repository;
  late LoginEntity loginEntityMock;

  late CurrentUserBloc bloc;

  setUp(() {
    repository = ILoginRepositoryMock();
    getCurrentuserUsecase = GetCurrentUser(repository);
    loginEntityMock = LoginEntityMock();
    bloc = CurrentUserBloc(getCurrentuserUsecase);
  });

  blocTest<CurrentUserBloc, CurrentUserState>(
    'current user bloc',
    build: () {
      when(() => getCurrentuserUsecase.call())
          .thenAnswer((_) => right(loginEntityMock));

      return bloc;
    },
    act: (bloc) => bloc.add(CheckCurrentUserEvent()),
    expect: () => [
      isA<CurrentUserLoading>(),
      isA<CurrentUserSuccess>(),
    ],
  );

  blocTest<CurrentUserBloc, CurrentUserState>(
    'should emit CurrentUserError ',
    build: () {
      when(() => getCurrentuserUsecase.call()).thenAnswer((_) =>
          left(const LoginException(message: 'message', stackTrace: null)));

      return bloc;
    },
    act: (bloc) => bloc.add(CheckCurrentUserEvent()),
    expect: () => [
      isA<CurrentUserLoading>(),
      isA<CurrentUserError>(),
    ],
  );
}
