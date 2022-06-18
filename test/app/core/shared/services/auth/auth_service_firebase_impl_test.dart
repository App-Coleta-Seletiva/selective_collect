import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:google_sign_in_mocks/google_sign_in_mocks.dart';
import 'package:selective_collect/app/core/shared/failures/exceptions.dart';
import 'package:selective_collect/app/core/shared/services/auth/auth_service_firebase_impl.dart';
import 'package:selective_collect/app/core/shared/services/auth/i_auth_service.dart';

// Ref: https://github.com/atn832/firebase_auth_mocks/blob/b021c703b1bad22f9bd47716bde183b0e3023405/test/firebase_auth_mocks_test.dart

void main() {
  test('Firebase ', () async {
    final googleSignIn = MockGoogleSignIn();
    final signinAccount = await googleSignIn.signIn();
    final googleAuth = await signinAccount!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    // Sign in.
    final user = MockUser(
      isAnonymous: false,
      uid: 'someuid',
      email: 'bob@somedomain.com',
      displayName: 'Bob',
    );
    final auth = MockFirebaseAuth(mockUser: user);
    final result = await auth.signInWithCredential(credential);
    final authUser = result.user;
    log('${authUser!.displayName}');
  });

  test('Get current user', () async {
    final auth = MockFirebaseAuth(
      signedIn: true,
      mockUser: MockUser(
        displayName: "name",
        email: "someemail@mail.com",
      ),
    );
    final service = FirebaseAuthService(auth);
    // const param =
    //     LoginWithEmailParam(email: 'bob@somedomain.com', password: '12345678');
    //await service.loginWithEmail(param);
    final user = service.getCurrentUser();
    log('${user!.email}');
  });

  group('Register User', () {
    test('Done', () async {
      final auth = MockFirebaseAuth();
      final service = FirebaseAuthService(auth);

      const param = RegisterWithEmailParam(
          email: 'bob@somedomain.com', password: '12345678');
      await service.registerWithEmail(param);
    });

    // test('email-already-in-use', () async {
    //   final auth = MockFirebaseAuth(
    //     authExceptions: AuthExceptions(
    //       createUserWithEmailAndPassword:
    //           FirebaseAuthException(code: 'invalid-email'),
    //     ),
    //   );
    //   final service = FirebaseAuthService(auth);

    //   const param = RegisterWithEmailParam(
    //       email: 'bob@somedomain.com', password: '12345678');
    //   await service.registerWithEmail(param);
    // });

    test('createUserWithEmailAndPassword', () async {
      final auth = MockFirebaseAuth(
        authExceptions: AuthExceptions(
          createUserWithEmailAndPassword:
              FirebaseAuthException(code: 'email-already-in-use'),
        ),
      );
      final service = FirebaseAuthService(auth);
      const params = RegisterWithEmailParam(email: '', password: '');
      expect(
        () async => await service.registerWithEmail(params),
        throwsA(
          isA<AuthException>().having(
              (e) => e.message, 'email already in use', 'Email já está em uso'),
        ),
      );
    });
  });

  // test('Forgot password', () async {
  //   // Package doesn't support.
  // });
}
