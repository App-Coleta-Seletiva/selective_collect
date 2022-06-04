import 'package:flutter_test/flutter_test.dart';
import 'package:selective_collect/app/core/shared/failures/exceptions.dart';
import 'package:selective_collect/app/core/shared/value_objects/login_parameters_type.dart';

void main() {
  test(
      'should return an instance of LoginParatersType'
      'if email password and works correct', () {
    //Arrange
    final params =
        LoginParametersType(email: 'teste@gmail.com', password: '123456789');
    //ACT

    //Expect
    expect(params, isA<LoginParametersType>());
  });

  test('should return an exception if the email does not contain @', () {
    //Expect
    expect(
        () =>
            LoginParametersType(email: 'testegmail.com', password: '123456789'),
        throwsA(isA<AuthException>()));
  });

  test('should return an exception if password is less than 8', () {
    //Expect
    expect(
        () => LoginParametersType(email: 'teste@gmail.com', password: '6789'),
        throwsA(isA<AuthException>()));
  });
}
