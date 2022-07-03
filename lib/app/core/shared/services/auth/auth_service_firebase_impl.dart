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
            stackTrace: e.stackTrace ?? stackTrace,
          );
        case 'user-not-found':
          throw AuthException(
            message: 'Usuário não encontrado',
            stackTrace: e.stackTrace ?? stackTrace,
          );

        default:
          throw AuthException(
            message: 'Erro em recuperar a senha',
            stackTrace: e.stackTrace ?? stackTrace,
          );
      }
    }
  }

  @override
  UserEntityService? getCurrentUser() {
    final user = _auth.currentUser;
    if (user != null) {
      return UserEntityService(user.email!);
    } else {
      return null;
    }
  }

  @override
  Future<void> loginWithEmail(LoginWithEmailParam param) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: param.email, password: param.password);
    } on FirebaseAuthException catch (e, stackTrace) {
      switch (e.code) {
        case 'invalid-email':
          throw AuthException(
            message: 'Email inválido',
            stackTrace: e.stackTrace ?? stackTrace,
          );
        case 'user-disabled':
          throw AuthException(
            message: 'Usuário desabilitado',
            stackTrace: e.stackTrace ?? stackTrace,
          );
        case 'user-not-found':
          throw AuthException(
            message: 'Usuário não encontrado',
            stackTrace: e.stackTrace ?? stackTrace,
          );
        case 'wrong-password':
          throw AuthException(
            message: 'Senha errada',
            stackTrace: e.stackTrace ?? stackTrace,
          );
        default:
          throw AuthException(
            message: 'Erro ao tentar logar',
            stackTrace: e.stackTrace ?? stackTrace,
          );
      }
    }
  }

  @override
  Future<void> registerWithEmail(RegisterWithEmailParam param) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: param.email, password: param.password);
    } on FirebaseAuthException catch (e, stackTrace) {
      switch (e.code) {
        case 'email-already-in-use':
          throw AuthException(
            message: 'Email já está em uso',
            stackTrace: e.stackTrace ?? stackTrace,
          );
        case 'invalid-email':
          throw AuthException(
            message: 'Email inválido',
            stackTrace: e.stackTrace ?? stackTrace,
          );
        case 'operation-not-allowed':
          throw AuthException(
            message: 'Conta desativada',
            stackTrace: e.stackTrace ?? stackTrace,
          );
        case 'weak-password':
          throw AuthException(
            message: 'Senha fraca',
            stackTrace: e.stackTrace ?? stackTrace,
          );
        default:
          throw AuthException(
            message: 'Erro ao registrar',
            stackTrace: e.stackTrace ?? stackTrace,
          );
      }
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e, stackTrace) {
      throw AuthException(
        message: 'Erro ao tentar sair da conta',
        stackTrace: e.stackTrace ?? stackTrace,
      );
    }
  }
}
