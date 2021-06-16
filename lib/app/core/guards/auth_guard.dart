import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthGuard implements RouteGuard {
  @override
  Future<bool> canActivate(String path, ModularRoute router) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogged = prefs.getString('user') != null;

    return Future.value(isLogged);
  }

  @override
  String? get guardedRoute => '/login';
}
