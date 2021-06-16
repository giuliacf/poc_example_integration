import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:poc_example_integration/app/modules/animals/repository/animals_store.dart';
import 'package:poc_example_integration/app/modules/products/repository/products_store.dart';
import 'package:poc_example_integration/app/modules/search_gifs/repository/search_gifs_store.dart';
import 'package:poc_example_integration/utils/strings.dart';

part 'app_bar_store.g.dart';

class AppBarStore = _AppBarStore with _$AppBarStore;

abstract class _AppBarStore with Store {
  final ProductsStore _productsStore = Modular.get<ProductsStore>();
  final SearchGifsStore _gifsStore = Modular.get<SearchGifsStore>();
  final AnimalsStore _animalsStore = Modular.get<AnimalsStore>();

  @observable
  String pageSelected = Strings.typeProduct;

  @observable
  String searchedWord = Strings.typeProduct;

  @observable
  int currentIndex = 0;

  @action
  void changeWord(String value) => searchedWord = value;

  @action
  void changeSelectedIndex(int index) {
    currentIndex = index;
    switch (index) {
      case 0:
        pageSelected = Strings.typeProduct;
        break;
      case 1:
        pageSelected = Strings.typeGif;
        break;
      case 2:
        pageSelected = Strings.typeAnimal;
        break;
    }
  }

  @action
  void search(String word) {
    switch (currentIndex) {
      case 0:
        _productsStore.searchProduct(word);
        break;
      case 1:
        _gifsStore.searchGifs(word);
        break;
      case 2:
        _animalsStore.searchAnimal(word);
    }
  }

  @action
  void clearSearch() {
    switch (currentIndex) {
      case 0:
        _productsStore.listProducts();
        break;
      case 1:
        _gifsStore.searchGifs('nazare');
        break;
      case 2:
        _animalsStore.getApiData();
    }

   changeWord(Strings.typeCurrentPage(pageSelected));
    print('');
  }
}
