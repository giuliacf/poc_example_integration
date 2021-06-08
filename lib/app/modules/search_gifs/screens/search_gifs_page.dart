import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:poc_example_integration/app/modules/search_gifs/repository/search_gifs_store.dart';
import 'package:poc_example_integration/screens/body_screen_custom.dart';
import 'package:poc_example_integration/screens/widgets/texts/text_custom.dart';
import 'package:poc_example_integration/utils/colors.dart';
import 'package:poc_example_integration/utils/strings.dart';

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
            builder: (_) => ListView(
                  children: [
                    this.store.isLoading
                        ? Center(
                            child: CircularProgressIndicator(color: aqua),
                          )
                        : GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 250,
                              mainAxisExtent: 250,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                            ),
                            itemCount: this.store.gifs.length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: Container(
                                  width: 260,
                                  height: 240,
                                  padding: EdgeInsets.all(30),
                                  child: Image.network(this.store.gifs[index]),
                                ),
                              );
                            },
                          ),
                    SizedBox(
                      height: 15,
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: this.store.searchGifs,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: TextCustom(
                            text: Strings.loadingMore,
                            textColor: blue,
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
      ),
    );
  }
}
