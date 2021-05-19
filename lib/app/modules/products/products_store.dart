import 'package:mobx/mobx.dart';

part 'products_store.g.dart';

class ProductsStore = ProductsStoreBase with _$ProductsStore;

abstract class ProductsStoreBase with Store {
  @observable
  int counter = 0;

  Future<void> increment() async {
    counter = counter + 1;
  }
}
