import 'package:flutter_modular/flutter_modular.dart';
import '../search_gifs/search_gifs_store.dart';

import 'search_gifs_page.dart';

class SearchGifsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SearchGifsStore()),

  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => SearchGifsPage()),
  ];
}
