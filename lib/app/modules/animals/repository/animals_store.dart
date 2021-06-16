import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
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

  @action
  changeApi(bool val) {
    animals.clear();
    isDogApi = val;
  }

  @action
  Future<void> getApiData() async {
    isLoading = true;
    try {
      final response = await http.get(
        Uri.parse(
          Urls.animalsApiUrl(isDogApi ? 'dog' : 'cat'),
        ),
      );

      switch (response.statusCode) {
        case 200:
          var jsonList = jsonDecode(response.body);
          print('URL ${Urls.animalsApiUrl(isDogApi ? 'dog' : 'cat')}');
          for (var i in jsonList) {
            if(i != null)
              animals.add(
                Animal(
                  name: i['breeds'][0]['name'],
                  photo: i['url'],
                  lifeTime: i['breeds'][0]['life_span'],
                ),
              );
          }
          break;
        default:
          break;
      }
    } catch (e) {
      print('URL ${Urls.animalsApiUrl(isDogApi ? 'dog' : 'cat')}');
      print('CATCHHHH $e');
      throw Exception('Failed to load album');
    }

    isLoading = false;
  }

  @action
  void searchAnimal(String word) {
    isLoading = true;
    animals.removeWhere(
      (element) => !element.name.toLowerCase().contains(
            word.toLowerCase(),
          ),
    );
    isLoading = false;
  }
}
