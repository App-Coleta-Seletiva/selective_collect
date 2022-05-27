import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:selective_collect/app/core/shared/failures/forgot_password_failure.dart';
import 'package:selective_collect/app/core/shared/services/auth/auth_service_firebase_impl.dart';
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

  test('Should return Sucess forgot password reporitory ...', () async {
    final repository = ForgotPasswordRepositoryImpl(service: service);
    when(() => service.forgotPassword(email))
        .thenAnswer((_) async => Future<void>);
    expect(await repository(email), isA<Right>());
  });

  test('Should return UserNotFoundFailure forgot password reporitory ...',
      () async {
    final repository = ForgotPasswordRepositoryImpl(service: service);
    when(() => service.forgotPassword(inexistEmail))
        .thenThrow(UserNotFoundFailure());

    var result = await repository(inexistEmail);
    expect(result, isA<Left>());
  });

  test('Should return InvalidEmailFailure forgot password reporitory ...',
      () async {
    final repository = ForgotPasswordRepositoryImpl(service: service);
    when(() => service.forgotPassword(invalidEmail))
        .thenThrow(InvalidEmailFailure());

    expect(await repository(invalidEmail), isA<Left>());
  });
}
