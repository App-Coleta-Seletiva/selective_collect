import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:selective_collect/app/core/shared/failures/forgot_password_failure.dart';
import 'package:selective_collect/app/core/shared/services/auth/auth_service_firebase_impl.dart';
import 'package:selective_collect/app/core/shared/services/auth/i_auth_service.dart';
import 'package:selective_collect/app/core/types/either.dart';
import 'package:selective_collect/app/modules/auth/submodules/forgot_password/domain/repositories/i_forgot_password_reporitory.dart';
import 'package:selective_collect/app/modules/auth/submodules/forgot_password/infra/repositories/forgot_password_reporitory.dart';

class FirebaseAuthServiceMock extends Mock implements FirebaseAuthService {}

Future<void> main() async {
  // Principal
  late final IAuthService service;
  late final IForgotPasswordRepository repository;
  // Params
  late final String email;
  late final String invalidEmail;

  setUpAll(() {
    service = FirebaseAuthServiceMock();
    repository = ForgotPasswordRepositoryImpl(service: service);
    email = "email@gmail.com";
    invalidEmail = "invalido";
  });

  group("forgot password reporitory:", () {
    test('Should return [✅ Sucess]', () async {
      //build
      when(() => service.forgotPassword(email))
          .thenAnswer((_) async => Future<Unit>);
      //act
      final result = repository(email);
      // expec
      expect(result, completes);
    });

    test('Should return [🧪 Failure] - UserNotFoundFailure', () async {
      //build
      when(() => service.forgotPassword(email))
          .thenThrow(UserNotFoundFailure());
      //act
      final result = await repository(email);
      // expec
      expect(result.fold((l) => l, (r) => r), isA<UserNotFoundFailure>());
    });

    test('Should return [🧪 Failure] - InvalidEmailFailure', () async {
      //build
      when(() => service.forgotPassword(invalidEmail))
          .thenThrow(InvalidEmailFailure());
      //act
      final result = await repository(invalidEmail);
      // expec
      expect(result.fold((l) => l, (r) => r), isA<InvalidEmailFailure>());
    });

    test('Should return [🧪 Failure] - IAppFailure', () async {
      //build
      when(() => service.forgotPassword(""))
          .thenThrow(const IAppFailure(message: "error"));
      //act
      final result = await repository("");
      //act
      expect(result.fold((l) => l, (r) => r), isA<IAppFailure>());
    });
  });
}
