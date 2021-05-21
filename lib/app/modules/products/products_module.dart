import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_example_integration/app/modules/products/repository/products_store.dart';
import 'package:poc_example_integration/app/modules/products/screens/add_product_page.dart';
import 'package:poc_example_integration/graphql_client.dart';

import 'screens/products_page.dart';

class ProductsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ProductsStore()),
    Bind.lazySingleton((i) => GraphQLConfiguration()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => ProductsPage()),
    ChildRoute('/adicionar-produto', child: (_, args) => AddProductPage()),
  ];
}
