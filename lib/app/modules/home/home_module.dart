import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_example_integration/app/modules/animals/repository/animals_store.dart';
import 'package:poc_example_integration/app/modules/app_bar/repository/app_bar_store.dart';
import 'package:poc_example_integration/app/modules/products/repository/products_store.dart';
import 'package:poc_example_integration/app/modules/search_gifs/repository/search_gifs_store.dart';
import '../../../graphql_client.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => ProductsStore()),
    Bind.singleton((i) => SearchGifsStore()),
    Bind.singleton((i) => AnimalsStore()),
    Bind.lazySingleton((i) => GraphQLConfiguration()),
    Bind.lazySingleton((i) => AppBarStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
  ];
}
