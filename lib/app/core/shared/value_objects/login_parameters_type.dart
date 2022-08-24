class LoginParametersType {
  static bool validatePassword(String password) {
    if (password.length < 8) return false;
    return true;
  }

  static bool validateEmail(String email) {
    if (!email.contains('@')) return false;
    return true;
  }

  static bool isEmpty(String email, String password) {
    if (email.isEmpty || password.isEmpty) return false;
    return true;
  }
}
