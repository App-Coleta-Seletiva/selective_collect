import 'package:firebase_auth/firebase_auth.dart';
import 'package:selective_collect/app/core/shared/failures/exceptions.dart';

import 'package:selective_collect/app/core/shared/services/auth/i_auth_service.dart';

class FirebaseAuthService implements IAuthService {
  final FirebaseAuth _auth;
  FirebaseAuthService(this._auth);

  @override
  Future<void> forgotPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e, stackTrace) {
      switch (e.code) {
        case 'invalid-email':
          throw AuthException(
              message: 'Email inválido',
              stackTrace: e.stackTrace ?? stackTrace);
        // case 'invalid-email-verified':
        //   throw AuthException(message: 'Email não verificado', stackTrace: stackTrace);

        default:
      }
    }
  }

  @override
  UserEntityService? getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<void> loginWithEmail(LoginWithEmailParam param) {
    // TODO: implement loginWithEmail
    throw UnimplementedError();
  }

  @override
  Future<void> registerWithEmail(RegisterWithEmailParam param) {
    // TODO: implement registerWithEmail
    throw UnimplementedError();
  }
}
