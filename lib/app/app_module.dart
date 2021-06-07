import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_example_integration/app/core/routes/authentication_guard.dart';
import 'package:poc_example_integration/app/core/routes/logged_guard.dart';
import 'package:poc_example_integration/app/modules/forget_password/forget_password_module.dart';
import 'package:poc_example_integration/app/modules/login/login_module.dart';
import 'package:poc_example_integration/app/modules/register/register_module.dart';
import 'package:poc_example_integration/app/modules/splash/splash_module.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      '/splash',
      module: SplashModule(),
    ),
    ModuleRoute(
      '/login',
      module: LoginModule(),
      guards: [LoggedGuard()],
    ),
    ModuleRoute(
      '/register',
      module: RegisterModule(),
      guards: [LoggedGuard()],
    ),
    ModuleRoute(
      '/home',
      module: HomeModule(),
      guards: [AuthenticationGuard()],
    ),
    ModuleRoute(
      '/forget-password',
      module: ForgetPasswordModule(),
      guards: [LoggedGuard()],
    ),
  ];
}
