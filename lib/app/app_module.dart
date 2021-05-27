import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_example_integration/app/core/routes/authentication_guard.dart';
import 'package:poc_example_integration/app/modules/login/login_module.dart';
import 'package:poc_example_integration/app/modules/products/products_module.dart';
import 'package:poc_example_integration/app/modules/register/register_module.dart';
import 'package:poc_example_integration/app/modules/search_gifs/search_gifs_module.dart';
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
    ),
    ModuleRoute(
      '/register',
      module: RegisterModule(),
    ),
    ModuleRoute(
      '/home',
      module: HomeModule(),
      guards: [AuthenticationRouteGuard()],
    ),
    ModuleRoute(
      '/products',
      module: ProductsModule(),
      guards: [AuthenticationRouteGuard()],
    ),
    ModuleRoute(
      '/search-gifs',
      module: SearchGifsModule(),
      guards: [AuthenticationRouteGuard()],
    ),
  ];
}
