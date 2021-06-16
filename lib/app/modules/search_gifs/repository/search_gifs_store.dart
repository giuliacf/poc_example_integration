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
  bool isLoading = false;

  @observable
  String? searchText;

  @action
  setSearchText(String? value) => searchText = value;

  @action
  Future<void> searchGifs(String text) async {
    isLoading = true;
    searchText = text;

    gifs = ObservableList<String>.of([]);
    try {
      final response = await http.get(
        Uri.parse(Urls.tenorApiUrl(text)),
      );

      if (response.statusCode == 200) {
        final jsonList = jsonDecode(response.body);
        final genreIdsFromJson = jsonList['results'];

        for (var i in genreIdsFromJson) {
          gifs.add(i['media'][0]['gif']['url']);
        }
      } else {
        throw Exception('Failed to load album');
      }
    } catch (e) {
      throw Exception('Failed to load album');
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> loadMoreGifs() async {
    isLoading = true;
    try {
      final response = await http.get(
        Uri.parse(Urls.tenorApiUrl(
          searchText ?? '',
          position: gifs.length + 1,
        )),
      );

      if (response.statusCode == 200) {
        final jsonList = jsonDecode(response.body);
        final genreIdsFromJson = jsonList['results'];

        for (var i in genreIdsFromJson) {
          gifs.add(i['media'][0]['gif']['url']);
        }
      } else {
        throw Exception('Failed to load album');
      }
    } catch (e) {
      throw Exception('Failed to load album');
    } finally {
      isLoading = false;
    }
  }
}
