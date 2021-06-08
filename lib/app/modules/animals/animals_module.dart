import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_example_integration/app/modules/animals/repository/animals_store.dart';

import 'screens/animals_page.dart';

class AnimalsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AnimalsStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => AnimalsPage()),
  ];
}
