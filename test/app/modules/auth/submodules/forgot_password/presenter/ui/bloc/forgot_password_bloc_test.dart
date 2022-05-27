import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:selective_collect/app/core/shared/failures/forgot_password_failure.dart';
import 'package:selective_collect/app/modules/auth/submodules/forgot_password/domain/usecases/forgot_password_usecase_impl.dart';
import 'package:selective_collect/app/modules/auth/submodules/forgot_password/presenter/ui/bloc/forgot_password_bloc.dart';

class ForgotPasswordUsecaseImplMock extends Mock
    implements ForgotPasswordUsecaseImpl {}

void main() {
  final ForgotPasswordUsecaseImplMock usecase = ForgotPasswordUsecaseImplMock();
  final ForgotPasswordBloc bloc = ForgotPasswordBloc(usecase);
  const String email = "email@gmail.com";
  group(
    "Group: [Forgot Password] ",
    () => {
      blocTest<ForgotPasswordBloc, ForgotPasswordState>(
        "Should return [Sucess]",
        setUp: () => when(() => usecase.call(email))
            .thenAnswer((_) async => const Right(true)),
        build: () => bloc,
        wait: const Duration(microseconds: 200),
        act: (bloc) => bloc.add(RecoverPasswordEvent(email: email)),
        expect: () => [ForgotPasswordLoading(), ForgotPasswordSucess()],
      )
    },
  );

  blocTest<ForgotPasswordBloc, ForgotPasswordState>(
    "Should return [Failure] for forgot pasword",
    setUp: () =>
        when(() => usecase(email)).thenThrow(() => Left(InvalidEmailFailure())),
    build: () => bloc,
    wait: const Duration(microseconds: 200),
    act: (bloc) => bloc.add(RecoverPasswordEvent(email: email)),
    expect: () => [ForgotPasswordLoading(), ForgotPasswordSucess()],
  );
}
