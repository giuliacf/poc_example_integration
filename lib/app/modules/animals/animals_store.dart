import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:poc_example_integration/app/modules/search_gifs/dog.dart';
import 'package:poc_example_integration/utils/urls.dart';

part 'animals_store.g.dart';

class AnimalsStore = _AnimalsStore with _$AnimalsStore;

abstract class _AnimalsStore with Store {
  @observable
  ObservableList<Dog> dogs = ObservableList<Dog>.of([]);


  @action
  Future<void> searchGifs() async {
    try {
      final response = await http.get(
        Uri.parse(animalsApiUrl),
      );

      if (response.statusCode == 200) {
        var jsonList = jsonDecode(response.body);
        var genreIdsFromJson = jsonList;

        for (var i in genreIdsFromJson) {
          print('name ${i['breeds'][0]['name']}');
          dogs.add(Dog(
              name: i['breeds'][0]['name'],
              photo: i['url'],
              life: i['breeds'][0]['life_span']
          ));
        }
      } else {
        throw Exception('Failed to load album');
      }
    } catch (e) {
      print('CATCHHH $e');
    }
  }

}