import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:selective_collect/app/modules/auth/submodules/forgot_password/infra/datasource/i_datasource.dart';
import 'package:selective_collect/app/modules/auth/submodules/forgot_password/infra/repositories/forgot_password_reporitory.dart';

class DataSourceMock extends Mock implements IDatasource {}

void main() {
  late final IDatasource datasouce;
  late final String email;

  setUpAll(() {
    datasouce = DataSourceMock();
    email = "email@gmail.com";
  });

  test('Should return Sucess forgot password reporitory ...', () async {
    final repository = ForgotPasswordRepositoryImpl(datasource: datasouce);
    when(() => datasouce.recoveryPasswordByMail(email))
        .thenAnswer((_) async => Future.value(const Right(true)));
    expect(await repository(email), isA<Right>());
  });

  test('Should return Exception forgot password reporitory ...', () async {
    final repository = ForgotPasswordRepositoryImpl(datasource: datasouce);
    when(() => datasouce.recoveryPasswordByMail(email))
        .thenThrow(Exception("Error no datasource"));

    expect(await repository(email), isA<Left>());
  });
}
