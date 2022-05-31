import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:selective_collect/app/core/shared/failures/forgot_password_failure.dart';
import 'package:selective_collect/app/core/types/either.dart';
import 'package:selective_collect/app/modules/auth/submodules/forgot_password/domain/repositories/i_forgot_password_reporitory.dart';
import 'package:selective_collect/app/modules/auth/submodules/forgot_password/domain/usecases/forgot_password_usecase_impl.dart';
import 'package:selective_collect/app/modules/auth/submodules/forgot_password/domain/usecases/i_forgot_password_usecase.dart';
import 'package:selective_collect/app/modules/auth/submodules/forgot_password/infra/repositories/forgot_password_reporitory.dart';

class ForgotPasswordRepositoryImplMock extends Mock
    implements ForgotPasswordRepositoryImpl {}

main() {
  late final IForgotPasswordRepository repository;
  late final IForgotPasswordUsecase usecase;
  const String email = "email@email.com";
  const String invalidEmail = "invalido.email.com";

  setUpAll(() {
    repository = ForgotPasswordRepositoryImplMock();
    usecase = ForgotPasswordUsecaseImpl(repository: repository);
  });

  group('Forgot password usecase', () {
    test('Should return [✅ Success]', () async {
      when(() => repository(email)).thenAnswer((_) async => right(true));
      expect((await usecase(email)).isRight, true);
    });

    test('Should return [🧪 Error] - Empty email', () async {
      when(() => repository(''))
          .thenAnswer((invocation) async => left(EmptyEmailFailure()));
      final response = await usecase('');
      expect(response.fold(id, id), isA<EmptyEmailFailure>());
    });

    test('Should return [🧪 Error] - Invalid Email', () async {
      when(() => repository(invalidEmail))
          .thenAnswer((_) async => left(InvalidEmailFailure()));
      final response = await usecase(invalidEmail);
      expect(response.fold(id, id), isA<InvalidEmailFailure>());
    });

    test('Shold return [🧪 Error] - User not found', () async {
      when(() => repository(email))
          .thenAnswer((_) async => left(UserNotFoundFailure()));
      final response = await usecase(email);
      expect(response.fold(id, id), isA<UserNotFoundFailure>());
    });
  });
}
