import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:selective_collect/app/core/types/either.dart';
import 'package:selective_collect/app/modules/auth/submodules/forgot_password/domain/usecases/forgot_password_usecase_impl.dart';
import 'package:selective_collect/app/modules/auth/submodules/forgot_password/domain/usecases/i_forgot_password_usecase.dart';
import 'package:selective_collect/app/modules/auth/submodules/forgot_password/presenter/ui/bloc/forgot_password_bloc.dart';

class ForgotPasswordUsecaseImplMock extends Mock
    implements ForgotPasswordUsecaseImpl {}

void main() {
  late final ForgotPasswordEvent event;
  late final IForgotPasswordUsecase usecase;
  late final ForgotPasswordBloc bloc;
  const String email = "email@gmail.com";

  group('forgot password bloc:', () {
    setUpAll(() {
      event = RecoverPasswordEvent(email: email);
      usecase = ForgotPasswordUsecaseImplMock();
      bloc = ForgotPasswordBloc(usecase);
    });
    blocTest<ForgotPasswordBloc, ForgotPasswordState>(
      "Should return [✅ Sucess]",
      setUp: () =>
          when(() => usecase.call(email)).thenAnswer((_) async => right(true)),
      build: () => bloc,
      // wait: const Duration(microseconds: 100),
      act: (bloc) => bloc.add(event),
      expect: () => [ForgotPasswordLoading(), ForgotPasswordSucess()],
    );
  });
}
