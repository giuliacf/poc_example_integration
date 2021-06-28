import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'package:poc_example_integration/app/modules/animals/repository/animals_store.dart';
import 'package:poc_example_integration/app/modules/products/repository/products_store.dart';
import 'package:poc_example_integration/app/modules/search_gifs/repository/search_gifs_store.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  final ProductsStore _productsStore = Modular.get<ProductsStore>();
  final SearchGifsStore _gifsStore = Modular.get<SearchGifsStore>();
  final AnimalsStore _animalsStore = Modular.get<AnimalsStore>();

  @observable
  TextEditingController searchTextController = TextEditingController();

  @observable
  String? searchText;

  @observable
  int currentIndex = 0;

  @computed
  bool get showCleanSearch => searchText != null && searchText!.isNotEmpty;

  @action
  dynamic changeSearch(String? value) => searchText = value;

  @action
  void changeSelectedIndex(int index) {
    currentIndex = index;

    if (index == 1) {
      searchText = 'nazare';
      searchTextController.text = 'nazare';
    } else {
      searchText = null;
      searchTextController.clear();
    }
  }

  @action
  void search() {
    if (searchText != null) {
      switch (currentIndex) {
        case 0:
          _productsStore.setSearchText(searchText);
          break;
        case 1:
          _gifsStore.searchGifs(searchText!);
          break;
        case 2:
          _animalsStore.setSearchText(searchText!);
      }
    }
  }

  @action
  void clearSearch() {
    searchText = null;
    searchTextController.clear();

    switch (currentIndex) {
      case 0:
        _productsStore.setSearchText(null);
        break;
      case 1:
        _gifsStore.searchGifs('nazare');
        searchText = 'nazare';
        searchTextController.text = 'nazare';
        break;
      case 2:
        _animalsStore.setSearchText(null);
        break;
    }
  }
}
