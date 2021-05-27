import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

part 'search_gifs_store.g.dart';

class SearchGifsStore = SearchGifsStoreBase with _$SearchGifsStore;

abstract class SearchGifsStoreBase with Store {

  @observable
  List<String> gifs = [];

  @observable
  String searchedWord = '';

  @action
  Future searchGifs() async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://g.tenor.com/v1/search?q=gretchen&key=ERHJ71YVS71E&limit=30&locale=en_US'),
      );

      print('status ${response.statusCode}');
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
  }
}
