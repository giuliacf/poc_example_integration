import 'package:flutter_modular/flutter_modular.dart';
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
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/login', module: LoginModule()),
    ModuleRoute('/products', module: ProductsModule()),
    ModuleRoute('/register', module: RegisterModule()),
    ModuleRoute('/search-gifs', module: SearchGifsModule()),
    ModuleRoute('/splash', module: SplashModule()),
  ];
}
