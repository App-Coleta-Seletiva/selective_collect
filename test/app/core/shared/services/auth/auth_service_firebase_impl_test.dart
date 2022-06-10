import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:google_sign_in_mocks/google_sign_in_mocks.dart';
import 'package:selective_collect/app/core/shared/services/auth/auth_service_firebase_impl.dart';
import 'package:selective_collect/app/core/shared/services/auth/i_auth_service.dart';

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

  test('description', () async {
    final auth = MockFirebaseAuth(
      //signedIn: true,
      mockUser: MockUser(
        displayName: "name",
        email: "someemail@mail.com",
      ),
    );
    final service = FirebaseAuthService(auth);
    const param =
        LoginWithEmailParam(email: 'bob@somedomain.com', password: '12345678');
    await service.loginWithEmail(param);
    final user = service.getCurrentUser();
    log('${user!.email}');
  });
}
