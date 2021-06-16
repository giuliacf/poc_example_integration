import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_example_integration/app/core/data/auth_datasource.dart';
import 'package:poc_example_integration/app/modules/animals/repository/animals_store.dart';
import 'package:poc_example_integration/app/modules/app_bar/repository/app_bar_store.dart';
import 'package:poc_example_integration/app/modules/app_bar/screens/app_bar_page.dart';
import 'package:poc_example_integration/app/modules/products/repository/products_store.dart';
import 'package:poc_example_integration/app/modules/search_gifs/repository/search_gifs_store.dart';
import 'package:poc_example_integration/utils/strings.dart';

class ForgetPasswordModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AppBarStore()),
    Bind.singleton((i) => ProductsStore()),
    Bind.singleton((i) => SearchGifsStore()),
    Bind.singleton((i) => AnimalsStore()),
    Bind.instance((i) => AuthDatasource()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => AppBarPage(
        currentPage: Strings.typeProduct,
      ),
    ),
  ];
}
