import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoggedGuard implements RouteGuard {
  @override
  Future<bool> canActivate(String path, ModularRoute router) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool notLogged = prefs.getString('user') == null;

    return Future.value(notLogged);
  }

  @override
  String? get guardedRoute => '/home';
}
