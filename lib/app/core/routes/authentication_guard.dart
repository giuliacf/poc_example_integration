import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthenticationRouteGuard implements RouteGuard {
  bool _isLogged = false;

  AuthenticationRouteGuard() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        _isLogged = true;
      }
    });
  }

  @override
  Future<bool> canActivate(String url, ModularRoute route) {
    //return Future.value(_isLogged);
    return Future.value(true);
  }

  @override
  String? get guardedRoute => '/login';
}
