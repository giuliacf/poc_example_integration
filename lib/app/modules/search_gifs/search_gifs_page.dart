import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_example_integration/app/modules/search_gifs/search_gifs_store.dart';

class SearchGifsPage extends StatefulWidget {
  final String title;
  const SearchGifsPage({Key? key, this.title = "SearchGifs"}) : super(key: key);

  @override
  _SearchGifsPageState createState() => _SearchGifsPageState();
}

class _SearchGifsPageState extends ModularState<SearchGifsPage, SearchGifsStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Observer(
        builder: (context) => Text('${store.counter}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          store.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
