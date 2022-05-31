import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:selective_collect/app/core/shared/failures/forgot_password_failure.dart';
import 'package:selective_collect/app/core/shared/services/auth/auth_service_firebase_impl.dart';
import 'package:selective_collect/app/core/types/either.dart';
import 'package:selective_collect/app/modules/auth/submodules/forgot_password/infra/repositories/forgot_password_reporitory.dart';

class FirebaseAuthServiceMock extends Mock implements FirebaseAuthService {}

Future<void> main() async {
  late final FirebaseAuthService service;
  late final String email;
  late final String invalidEmail;
  late final String inexistEmail;

  setUpAll(() {
    service = FirebaseAuthServiceMock();
    email = "email@gmail.com";
    inexistEmail = "naoexiste@gmail.com";
    invalidEmail = "invalido.gmail.com";
  });

  group("forgot password reporitory:", () {
    test('Should return [✅ Sucess]', () async {
      final repository = ForgotPasswordRepositoryImpl(service: service);
      when(() => service.forgotPassword(email))
          .thenAnswer((_) async => Future<void>);
      expect(await repository(email), isA<Either>());
    });

    test('Should return [🧪 Failure] - UserNotFoundFailure', () async {
      final repository = ForgotPasswordRepositoryImpl(service: service);
      when(() => service.forgotPassword(inexistEmail))
          .thenThrow(UserNotFoundFailure());

      var result = await repository(inexistEmail);
      expect(result, isA<Either>());
    });

    test('Should return [🧪 Failure] - InvalidEmailFailure', () async {
      final repository = ForgotPasswordRepositoryImpl(service: service);
      when(() => service.forgotPassword(invalidEmail))
          .thenThrow(InvalidEmailFailure());

      expect(await repository(invalidEmail), isA<Either>());
    });

    test('Should return [🧪 Failure] - IAppFailure', () async {
      final repository = ForgotPasswordRepositoryImpl(service: service);
      when(() => service.forgotPassword(invalidEmail))
          .thenThrow(Exception("Error não tratado"));

      expect(await repository(invalidEmail), isA<Either>());
    });
  });
}
