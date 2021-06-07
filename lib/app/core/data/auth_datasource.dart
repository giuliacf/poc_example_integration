import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthDatasource {
  Future<void> registerWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> loginWithEmail({
    required String email,
    required String password,
  }) async {
    // await FirebaseAuth.instance.signInWithEmailAndPassword(
    //   email: email,
    //   password: password,
    // );
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: 'giulia@teste.com',
      password: '123456',
    );
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    Modular.to.navigate('/login');
  }

  Future<void> signInWithGoogle({required BuildContext context}) async {
    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();

      try {
        await FirebaseAuth.instance.signInWithPopup(authProvider);
      } catch (e) {
        print(e);
      }
    }
  }
}
