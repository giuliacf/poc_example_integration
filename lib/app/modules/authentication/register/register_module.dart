import 'package:flutter_modular/flutter_modular.dart';

import 'package:poc_example_integration/app/core/data/auth_datasource.dart';
import 'package:poc_example_integration/app/modules/authentication/register/repository/register_store.dart';
import 'package:poc_example_integration/app/modules/authentication/register/screens/register_page.dart';

class RegisterModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RegisterStore()),
    Bind.instance((i) => AuthDatasource()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => RegisterPage()),
  ];
}
