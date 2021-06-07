import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:poc_example_integration/utils/urls.dart';

import '../animals/animal.dart';

part 'search_gifs_store.g.dart';

class SearchGifsStore = SearchGifsStoreBase with _$SearchGifsStore;

abstract class SearchGifsStoreBase with Store {
  @observable
  ObservableList<String> gifs = ObservableList<String>.of([]);

  @observable
  String searchedWord = '';

  @observable
  bool isLoading = false;

  @action
  Future<void> searchGifs() async {
    isLoading = true;
    try {
      final response = await http.get(
        Uri.parse(Urls.tenorApiUrl),
      );

      if (response.statusCode == 200) {
        var jsonList = jsonDecode(response.body);
        var genreIdsFromJson = jsonList['results'];
        for (var i in genreIdsFromJson) {
          gifs.add(i['media'][0]['gif']['url']);
        }
      } else {
        throw Exception('Failed to load album');
      }
    } catch (e) {
      print('CATCHHH $e');
    }
    isLoading = false;
  }
}
