import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:selective_collect/app/core/shared/services/auth/auth_service_firebase_impl.dart';
import 'package:selective_collect/app/core/shared/services/auth/i_auth_service.dart';
import 'package:selective_collect/app/core/types/either.dart';
import 'package:selective_collect/app/modules/auth/submodules/register/external/register_datasource_impl.dart';
import 'package:selective_collect/app/modules/auth/submodules/register/infra/datasources/i_register_datasource.dart';

void main() {
  late IRegisterDatasource datasource;
  late RegisterWithEmailParam params;
  late IAuthService auth;

  setUp(() {
    auth = FirebaseAuthServiceMock();
    datasource = RegisterDatasourceImpl(auth);
    params = const RegisterWithEmailParam(email: 'email', password: 'password');
  });

  group('RegisterDatasource Test - Sucess', () {
    test('Should return true', () async {
      when(() => datasource.registerWithEmail(params))
          .thenAnswer((_) async => right(true));

      final result = await datasource.registerWithEmail(params);

      expect(result.fold((l) => l, (r) => r), true);
    });
  });
}

class RegisterDatasourceMock extends Mock implements RegisterDatasourceImpl {}

class FirebaseAuthServiceMock extends Mock implements FirebaseAuthService {}
