import '../failures/exceptions.dart';

class LoginParametersType {
  final String email;
  final String password;

  LoginParametersType({
    required String email,
    required String password,
  })  : email = email.trim(),
        password = password.trim() {
    _valid();
  }

  void _valid() {
    if (!_validatePassword(password)) {
      throw AuthException(
        message: 'Senha deve conter no minio 8 caracter',
        stackTrace: StackTrace.current,
      );
    } else if (!_validateEmail(email)) {
      throw AuthException(
        message: 'Email deve conter @',
        stackTrace: StackTrace.current,
      );
    }
  }

  static bool _validatePassword(String password) {
    if (password.length < 8) return false;
    return true;
  }

  static bool _validateEmail(String email) {
    if (!email.contains('@')) return false;
    return true;
  }
}
