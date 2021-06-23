import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthDatasource {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> _setUser(UserCredential credentials) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('user', credentials.user!.email!);
  }

  Future<void> _clearUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }

  Future<void> registerWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    final credentials = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await _setUser(credentials);
  }

  Future<void> loginWithEmail({
    required String email,
    required String password,
  }) async {
    final credentials = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    await _setUser(credentials);
  }

  Future<void> logout() async {
    await auth.signOut();
    await _clearUser();

    Modular.to.navigate('/login');
  }

  Future<void> signInWithGoogle({required BuildContext context}) async {
    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();

      try {
        final credentials = await auth.signInWithPopup(authProvider);
        await _setUser(credentials);
      } catch (e) {
        print(e);
      }
    }
  }
}
