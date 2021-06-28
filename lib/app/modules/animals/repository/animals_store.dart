import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;
import 'package:iupp_components/iupp_components.dart';
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
  dynamic setSearchText(String? value) => searchText = value;

  @action
  void changeApi({required bool val}) {
    animals.clear();
    isDogApi = val;
  }

  @action
  Future<void> getApiData(BuildContext context) async {
    apiPage = 0;
    animals = ObservableList<Animal>.of([]);

    isLoading = true;
    try {
      await _getAnimalsFromApi();
    } on Exception catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        IuppErrorSnackBar(
          context,
          message: AppLocalizations.of(context)!.loginProblem,
        ),
      );
    }
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
        getAnimalsApiUrl(
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
    } on Exception catch (e) {
      print(e);
      throw Exception('Unable to get the ${isDogApi ? 'dogs' : 'cats'}');
    }
  }
}
