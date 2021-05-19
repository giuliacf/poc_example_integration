import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_example_integration/app/modules/login/login_store.dart';

import 'login_page.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => LoginPage()),
  ];
}
