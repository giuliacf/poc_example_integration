import 'package:flutter_modular/flutter_modular.dart';

import 'package:poc_example_integration/app/core/data/auth_datasource.dart';
import 'package:poc_example_integration/app/core/guards/auth_guard.dart';
import 'package:poc_example_integration/app/core/guards/logged_guard.dart';
import 'package:poc_example_integration/app/modules/authentication/forget_password/forget_password_module.dart';
import 'package:poc_example_integration/app/modules/authentication/login/login_module.dart';
import 'package:poc_example_integration/app/modules/authentication/register/register_module.dart';
import 'package:poc_example_integration/app/modules/splash/splash_module.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => AuthDatasource()),
  ];

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
      guards: [AuthGuard()],
    ),
    ModuleRoute(
      '/forget-password',
      module: ForgetPasswordModule(),
      guards: [LoggedGuard()],
    ),
  ];
}
