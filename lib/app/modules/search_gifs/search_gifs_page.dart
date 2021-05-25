import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:poc_example_integration/app/modules/search_gifs/search_gifs_store.dart';

class SearchGifsPage extends StatefulWidget {
  final String title;

  const SearchGifsPage({Key? key, this.title = "SearchGifs"}) : super(key: key);

  @override
  _SearchGifsPageState createState() => _SearchGifsPageState();
}

class _SearchGifsPageState
    extends ModularState<SearchGifsPage, SearchGifsStore> {

  List<String> gifs = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: gifs.length,
        itemBuilder: (_, index) => Image.network(gifs[index]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {

            final response = await http.get(
              Uri.parse(
                  'https://g.tenor.com/v1/search?q=gretchen&key=ERHJ71YVS71E&limit=30&locale=en_US'),
            );
            if (response.statusCode == 200) {
              print('caiu aqui pelo menos');
              setState(() {
                var jsonList = jsonDecode(response.body);

                var genreIdsFromJson = jsonList['results'];
                for (var i in genreIdsFromJson) {
                  gifs.add(i['media'][0]['gif']['url']);
                }
              });
            } else {
              throw Exception('Failed to load album');
            }
          } catch (e) {
            print('CATCHHH $e');
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
