import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthenticationGuard implements RouteGuard {
  bool _isLogged = false;

  AuthenticationGuard() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        _isLogged = true;
      }
    });
  }

  @override
  Future<bool> canActivate(String url, ModularRoute route) {
    return Future.value(_isLogged);
  }

  @override
  String? get guardedRoute => '/login';
}
