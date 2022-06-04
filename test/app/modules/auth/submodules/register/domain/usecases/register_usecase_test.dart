import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:selective_collect/app/core/shared/failures/register_errors.dart';
import 'package:selective_collect/app/core/shared/services/auth/i_auth_service.dart';
import 'package:selective_collect/app/core/types/either.dart';
import 'package:selective_collect/app/modules/auth/submodules/register/domain/repositories/i_register_repository.dart';
import 'package:selective_collect/app/modules/auth/submodules/register/domain/usecases/i_register_usecase.dart';
import 'package:selective_collect/app/modules/auth/submodules/register/domain/usecases/register_usecase.dart';

void main() {
  late IRegisterRepository repository;
  late RegisterParamMock params;
  late UnitMock unit;
  late IRegisterUsecase register;

  setUp(() {
    repository = RegisterRepositoryMock();
    params = RegisterParamMock();
    unit = UnitMock();
    register = RegisterUsecaseImpl(repository);
  });

  group('RegisterCase - Success: ', () {
    test('should return an instance of Unit', () async {
      when(() => params.email).thenReturn('email@email.com');
      when(() => params.password).thenReturn('12345678');
      when(() => repository(params)).thenAnswer((_) async => right(unit));
      final result = await register(params);
      expect(result.fold((l) => l, (r) => r), isA<Unit>());
    });
  });

  group('RegisterCase Test - Erros: ', () {
    test('Should return an instance of EmailError when email is empty',
        () async {
      when(() => params.email).thenReturn('');
      when(() => params.password).thenReturn('123456789');

      final result = await register(params);

      expect(result.fold((l) => l, (r) => r), isA<EmailError>());
    });

    test('Should return an instance of EmailError when email is entered wrong',
        () async {
      when(() => params.email).thenReturn('emailemail.com');
      when(() => params.password).thenReturn('123456789');

      final result = await register(params);

      expect(result.fold((l) => l, (r) => r), isA<EmailError>());
    });

    test(
        'should return an instance of PasswordError when the password is less than 8',
        () async {
      when(() => params.email).thenReturn('email@email.com');
      when(() => params.password).thenReturn('1234567');

      final result = await register(params);

      expect(result.fold((l) => l, (r) => r), isA<PasswordError>());
    });
  });
}

class RegisterRepositoryMock extends Mock implements IRegisterRepository {}

class RegisterParamMock extends Mock implements RegisterWithEmailParam {}

class UnitMock extends Mock implements Unit {}

class RegisterCaseMock extends Mock implements IRegisterUsecase {}
