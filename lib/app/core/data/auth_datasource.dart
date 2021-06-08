import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthDatasource {
  final FirebaseAuth auth = FirebaseAuth.instance;

  AuthDatasource() {
    print(auth);
  }

  Stream<User?> get authChanges => auth.authStateChanges();

  Future<void> registerWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> loginWithEmail({
    required String email,
    required String password,
  }) async {
    await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> logout() async {
    await auth.signOut();
    Modular.to.navigate('/login');
  }

  Future<void> signInWithGoogle({required BuildContext context}) async {
    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();

      try {
        await auth.signInWithPopup(authProvider);
      } catch (e) {
        print(e);
      }
    }
  }
}
