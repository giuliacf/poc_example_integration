import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:poc_example_integration/app/modules/animals/animal.dart';
import 'package:poc_example_integration/utils/urls.dart';

part 'animals_store.g.dart';

class AnimalsStore = _AnimalsStore with _$AnimalsStore;

abstract class _AnimalsStore with Store {
  @observable
  ObservableList<Animal> animals = ObservableList<Animal>.of([]);

  @observable
  bool isDogApi = false;

  @action
  changeApi(bool val) {
    animals.clear();
    isDogApi = val;
  }

  @action
  Future<void> getApiData() async {
    try {
      final response = await http.get(
        Uri.parse(
          Urls.animalsApiUrl(isDogApi ? 'dog' : 'cat'),
        ),
      );

      if (response.statusCode == 200) {
        var jsonList = jsonDecode(response.body);
        var genreIdsFromJson = jsonList;

        for (var i in genreIdsFromJson) {
          animals.add(
            Animal(
                name: i['breeds'][0]['name'],
                photo: i['url'],
                lifeTime: i['breeds'][0]['life_span']),
          );
        }
      } else {
        throw Exception('Failed to load album');
      }
    } catch (e) {
      print('CATCHHH $e');
    }
  }
}
