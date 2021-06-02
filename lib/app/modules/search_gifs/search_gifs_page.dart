import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:poc_example_integration/app/modules/search_gifs/search_gifs_store.dart';
import 'package:poc_example_integration/utils/colors.dart';

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
      backgroundColor: greyOffWhite,
      body: Observer(
        builder: (_) => ListView.builder(
            itemCount: this.store.gifs.length,
            itemBuilder: (_, index) => Observer(
                  builder: (_) => Image.network(
                    this.store.gifs[index],
                  ),
                )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await this.store.searchGifs(),
        child: Icon(Icons.add),
      ),
    );
  }
}
