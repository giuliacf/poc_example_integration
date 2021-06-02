import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_example_integration/app/modules/products/repository/products_store.dart';
import 'package:poc_example_integration/app/modules/search_gifs/search_gifs_store.dart';
import '../../../graphql_client.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ProductsStore()),
    Bind.lazySingleton((i) => SearchGifsStore()),
    Bind.lazySingleton((i) => GraphQLConfiguration()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
  ];
}
