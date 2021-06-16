import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_example_integration/app/modules/authentication/forget_password/repository/forget_password_store.dart';
import 'package:poc_example_integration/app/modules/authentication/forget_password/screens/forget_password_page.dart';

class ForgetPasswordModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ForgetPasswordStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => ForgetPasswordPage()),
  ];
}
