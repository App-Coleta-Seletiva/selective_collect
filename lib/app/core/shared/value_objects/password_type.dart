import '../failures/errors.dart';

class PasswordType {
  final String value;

  PasswordType(String value) : value = value.trim() {
    if (!_validate(value)) {
      throw PasswordError(
        message: 'A senha é inválida',
        stackTrace: StackTrace.current,
      );
    }
  }

  static bool _validate(String value) {
    if (value.length < 8) return false;
    return true;
  }

  static String? validate(String? value) {
    if (value == null || !_validate(value)) {
      return 'A senha inválida';
    }
    return null;
  }
}
