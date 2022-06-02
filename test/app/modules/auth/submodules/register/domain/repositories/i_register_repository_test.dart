import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:selective_collect/app/core/shared/failures/i_app_exception.dart';
import 'package:selective_collect/app/core/shared/failures/register_errors.dart';
import 'package:selective_collect/app/core/types/either.dart';
import 'package:selective_collect/app/modules/auth/submodules/register/domain/repositories/i_register_repository.dart';
import 'package:selective_collect/app/modules/auth/submodules/register/domain/types/register_params.dart';

void main() {
  late RegisterRepositoryMock repository;
  late RegisterParamMock params;
  late UnitMock unit;

  setUp(() {
    repository = RegisterRepositoryMock();
    params = RegisterParamMock();
    unit = UnitMock();
  });

  group('Success: ', () {
    test('should return a rigth unit', () async {
      when(() => repository(params)).thenAnswer((_) async => right(unit));
      final result = await repository(params);
      expect(result.isRight, true);
    });
  });

  group('Erros: ', () {
    test('Should return a failure IAppException to EmailError', () async {
      when(() => repository(params))
          .thenAnswer((invocation) async => left(const EmailError()));

      final result = await repository(params);

      expect(result.fold((l) => l, (r) => r), isA<IAppException>());
    });

    test('Should return a failure IAppException to PasswordError', () async {
      when(() => repository(params))
          .thenAnswer((invocation) async => left(const PasswordError()));

      final result = await repository(params);

      expect(result.fold((l) => l, (r) => r), isA<IAppException>());
    });
  });
}

class RegisterRepositoryMock extends Mock implements IRegisterRepository {}

class RegisterParamMock extends Mock implements RegisterParams {}

class UnitMock extends Mock implements Unit {}
