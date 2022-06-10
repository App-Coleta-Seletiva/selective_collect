import 'package:flutter_test/flutter_test.dart';
import 'package:selective_collect/app/core/shared/value_objects/login_parameters_type.dart';

void main() {
  test('should return true if correct email', () {
    //Arrange
    final params = LoginParametersType.validateEmail('teste@gmail.com');
    //ACT

    //Expect
    expect(params, true);
  });

  test('should return true if correct password', () {
    //Arrange
    final params = LoginParametersType.validatePassword('123456789');

    //Expect
    expect(params, true);
  });

  test('should return false if incorrect email', () {
    //Arrange
    final params = LoginParametersType.validateEmail('testegmail.com');
    //ACT

    //Expect
    expect(params, false);
  });

  test('should return false if incorrect password', () {
    //Arrange
    final params = LoginParametersType.validatePassword('123456');

    //Expect
    expect(params, false);
  });
}
