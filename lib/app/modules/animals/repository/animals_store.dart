import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

import 'package:poc_example_integration/app/modules/animals/models/animal.dart';
import 'package:poc_example_integration/utils/urls.dart';

part 'animals_store.g.dart';

class AnimalsStore = _AnimalsStore with _$AnimalsStore;

abstract class _AnimalsStore with Store {
  @observable
  ObservableList<Animal> animals = ObservableList<Animal>.of([]);

  @observable
  bool isDogApi = false;

  @observable
  bool isLoading = false;

  @observable
  bool isLoadingMore = false;

  @observable
  String? searchText;

  @observable
  int apiPage = 0;

  @computed
  List<Animal> get animalsFiltered => searchText == null
      ? animals.toList()
      : animals
          .where(
              (p) => p.name.toLowerCase().contains(searchText!.toLowerCase()))
          .toList();

  @action
  setSearchText(String? value) => searchText = value;

  @action
  void changeApi(bool val) {
    animals.clear();
    isDogApi = val;
  }

  @action
  Future<void> getApiData() async {
    apiPage = 0;
    animals = ObservableList<Animal>.of([]);

    isLoading = true;
    await _getAnimalsFromApi();
    isLoading = false;
  }

  @action
  Future<void> loadMoreAnimals() async {
    apiPage++;

    isLoadingMore = true;
    await _getAnimalsFromApi();
    isLoadingMore = false;
  }

  Future<void> _getAnimalsFromApi() async {
    try {
      final response = await http.get(Uri.parse(
        Urls.animalsApiUrl(
          typeAnimal: isDogApi ? 'dog' : 'cat',
          page: apiPage,
        ),
      ));

      if (response.statusCode == 200) {
        final jsonList = jsonDecode(response.body);
        for (final i in jsonList) {
          if (i != null) {
            animals.add(
              Animal(
                name: i['breeds'][0]['name'],
                photo: i['url'],
                lifeTime: i['breeds'][0]['life_span'],
              ),
            );
          }
        }
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e);
      // throw Exception('Unable to get the ${isDogApi ? 'dogs' : 'cats'}');
    }
  }
}
