import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_example_integration/app/core/data/auth_datasource.dart';

import 'splash_page.dart';

class SplashModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AuthDatasource()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => SplashPage()),
  ];
}
