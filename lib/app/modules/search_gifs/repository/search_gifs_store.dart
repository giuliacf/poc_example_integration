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
    searchText = text;
    gifs = ObservableList<String>.of([]);

    await _getGifsFromApi(Urls.tenorApiUrl(text));
  }

  @action
  Future<void> loadMoreGifs() async {
    final url = Urls.tenorApiUrl(
      searchText ?? '',
      position: gifs.length + 1,
    );

    await _getGifsFromApi(url);
  }

  Future<void> _getGifsFromApi(String url) async {
    isLoading = true;
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonList = jsonDecode(response.body);
        final genreIdsFromJson = jsonList['results'];

        for (var i in genreIdsFromJson) {
          gifs.add(i['media'][0]['gif']['url']);
        }
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    } finally {
      isLoading = false;
    }
  }
}
