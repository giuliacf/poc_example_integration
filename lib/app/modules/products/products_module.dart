import 'package:flutter_modular/flutter_modular.dart';

import 'package:poc_example_integration/app/modules/products/repository/products_store.dart';
import 'package:poc_example_integration/graphql_client.dart';

class ProductsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.instance((i) => ProductsStore()),
    Bind.instance((i) => GraphQLConfiguration()),
  ];
}
