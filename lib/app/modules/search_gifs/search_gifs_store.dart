import 'package:mobx/mobx.dart';

part 'search_gifs_store.g.dart';

class SearchGifsStore = SearchGifsStoreBase with _$SearchGifsStore;

abstract class SearchGifsStoreBase with Store {
  @observable
  int counter = 0;

  Future<void> increment() async {
    counter = counter + 1;
  }
}
