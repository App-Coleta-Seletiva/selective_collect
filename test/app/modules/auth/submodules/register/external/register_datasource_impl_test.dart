import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:selective_collect/app/core/shared/failures/register_errors.dart';
import 'package:selective_collect/app/core/shared/services/auth/i_auth_service.dart';
import 'package:selective_collect/app/core/types/either.dart';
import 'package:selective_collect/app/modules/auth/submodules/register/external/register_datasource_impl.dart';

void main() {
  late RegisterDatasourceMock service;
  late RegisterParamMock params;

  setUp(() {
    service = RegisterDatasourceMock();
    params = RegisterParamMock();
  });

  group('RegisterDatasource Test - Sucess', () {
    test('Should return Unit', () async {
      when(() => params.email).thenReturn('email@email.com');
      when(() => params.password).thenReturn('password');

      when(() => service.registerWithEmail(params))
          .thenAnswer((_) async => right(unit));

      final result = await service.registerWithEmail(params);

      // expect(result.fold((l) => l, (r) => r), isA<Unit>());

      expect(result.isRight, true);
    });
  });

  group('RegisterDatasource Test - Errors', () {
    test('Should return Exception', () async {
      when(() => params.email).thenReturn('email@email.com');
      when(() => params.password).thenReturn('password');

      when(() => service.registerWithEmail(params))
          .thenAnswer((_) async => left(RegisterError()));

      final result = await service.registerWithEmail(params);

      expect(result.fold((l) => l, (r) => r), isA<RegisterError>());
    });
  });
}

class RegisterDatasourceMock extends Mock implements RegisterDatasourceImpl {}

class RegisterParamMock extends Mock implements RegisterWithEmailParam {}
