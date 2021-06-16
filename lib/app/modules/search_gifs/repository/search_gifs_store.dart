import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:poc_example_integration/utils/urls.dart';
import 'package:http/http.dart' as http;

part 'search_gifs_store.g.dart';

class SearchGifsStore = _SearchGifsStore with _$SearchGifsStore;

abstract class _SearchGifsStore with Store {
  @observable
  ObservableList<String> gifs = ObservableList<String>.of([]);

  @observable
  String wordSearched = '';

  @observable
  bool isLoading = false;

  @action
  Future<dynamic> searchGifs(String word) async {
    isLoading = true;
    gifs = ObservableList<String>.of([]);
    wordSearched = word;
    try {
      final response = await http.get(
        Uri.parse(Urls.tenorApiUrl(word)),
      );

      switch (response.statusCode) {
        case 200:
          var jsonList = jsonDecode(response.body);
          var genreIdsFromJson = jsonList['results'];
          for (var i in genreIdsFromJson) {
            gifs.add(i['media'][0]['gif']['url']);
          }
          break;
        default:
          break;
      }
    } catch (e) {
      throw Exception('Failed to load album');
    }
    isLoading = false;
  }
}
