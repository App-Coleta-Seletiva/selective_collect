import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:selective_collect/app/core/shared/failures/forgot_password_failure.dart';
import 'package:selective_collect/app/core/shared/services/auth/auth_service_firebase_impl.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

void main() {
  late final MockFirebaseAuth auth;
  late final FirebaseAuthService service;
  const String email = "email@gmail.com";

  setUpAll(() {
    auth = MockFirebaseAuth();
    service = FirebaseAuthService(auth);
  });

  group("SHARED firebase auth service:", () {
    test('should return [✅ Sucess]', () async {
      when(() => auth.sendPasswordResetEmail(email: email))
          .thenAnswer((_) async {
        Future.delayed(const Duration(microseconds: 100));
      });

      await service.forgotPassword(email);
      verify(() => auth.sendPasswordResetEmail(email: email)).called(1);
    });

    test('should return [🧪 Failure] - InvalidEmailFailure', () async {
      when(() => auth.sendPasswordResetEmail(email: email)).thenThrow(
        FirebaseAuthException(code: 'invalid-email'),
      );

      var future = service.forgotPassword(email);
      await expectLater(future, throwsA(isA<InvalidEmailFailure>()));
    });

    test('should return [🧪 Failure] - UserNotFoundFailure', () async {
      when(() => auth.sendPasswordResetEmail(email: email)).thenThrow(
        FirebaseAuthException(code: 'user-not-found'),
      );

      var future = service.forgotPassword(email);
      await expectLater(future, throwsA(isA<UserNotFoundFailure>()));
    });

    test('should return [🧪 Failure] - IAppFailure', () async {
      when(() => auth.sendPasswordResetEmail(email: "")).thenThrow(
        FirebaseAuthException(code: 'error-no-tratado'),
      );

      var future = service.forgotPassword("");
      await expectLater(future, throwsA(isA<IAppFailure>()));
    });
  });
}
