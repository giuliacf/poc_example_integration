import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:poc_example_integration/app/modules/search_gifs/search_gifs_store.dart';
import 'package:poc_example_integration/screens/body_screen_custom.dart';
import 'package:poc_example_integration/utils/colors.dart';

class SearchGifsPage extends StatefulWidget {
  final String title;

  const SearchGifsPage({Key? key, this.title = "SearchGifs"}) : super(key: key);

  @override
  _SearchGifsPageState createState() => _SearchGifsPageState();
}

class _SearchGifsPageState
    extends ModularState<SearchGifsPage, SearchGifsStore> {
  @override
  void initState() {
    super.initState();
    this.store.searchGifs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyOffWhite,
      body: BodyScreenCustom(
        body: Observer(
          builder: (_) => GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250,
              mainAxisExtent: 250,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: this.store.gifs.length,
            itemBuilder: (context, index) {
              return Image.network(this.store.gifs[index]);
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await this.store.searchGifs(),
        child: Icon(Icons.add),
      ),
    );
  }
}
