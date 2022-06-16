import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:selective_collect/app/core/shared/services/auth/i_auth_service.dart';
import 'package:selective_collect/app/core/types/either.dart';
import 'package:selective_collect/app/modules/auth/submodules/register/domain/repositories/i_register_repository.dart';
import 'package:selective_collect/app/modules/auth/submodules/register/domain/usecases/i_register_usecase.dart';
import 'package:selective_collect/app/modules/auth/submodules/register/infra/repositories/register_repository_impl.dart';

void main() {
  late IRegisterRepository repository;
  late RegisterWithEmailParam params;

  setUp(() {
    repository = RegisterRepositoryImplMock();
    params = RegisterParamMock();
  });
  
  group('RegisterRepositoryImpl Test - Success:', () {
    
  test('Should return a Rigth Unit', () async {
    when(() => repository(params)).thenAnswer((_) async => right(unit));

    final result = await repository(params);

    expect(result.isRight, true);
  });
  });

}

class RegisterRepositoryImplMock extends Mock
    implements RegisterRepositoryImpl {}

class RegisterParamMock extends Mock implements RegisterWithEmailParam {}

class UnitMock extends Mock implements Unit {}

class RegisterCaseMock extends Mock implements IRegisterUsecase {}
