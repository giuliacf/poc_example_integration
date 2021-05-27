import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:poc_example_integration/app/modules/products/screens/products_page.dart';
import 'package:poc_example_integration/app/modules/search_gifs/search_gifs_page.dart';
import 'package:poc_example_integration/utils/strings.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  String currentPage = Strings.products;

  @observable
  int currentIndex = 0;

  @observable
  List<Widget> screens = [
    ProductsPage(),
    SearchGifsPage(),
  ];

  @action
  void changePage(int index) {
    currentIndex = index;
    if(currentPage == Strings.products)
      currentPage = Strings.searchGifs;
    else
      currentPage = Strings.products;

  }
}
