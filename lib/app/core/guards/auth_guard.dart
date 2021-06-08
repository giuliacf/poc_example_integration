import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthGuard implements RouteGuard {
  @override
  Future<bool> canActivate(String path, ModularRoute router) {
    Future.delayed(Duration(seconds: 1));
    print(FirebaseAuth.instance);
    bool isLogged = FirebaseAuth.instance.currentUser != null;
    return Future.value(isLogged);
  }

  @override
  String? get guardedRoute => '/login';
}
