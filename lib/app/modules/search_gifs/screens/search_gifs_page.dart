import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:poc_example_integration/app/modules/search_gifs/repository/search_gifs_store.dart';
import 'package:poc_example_integration/screens/widgets/widget_load_more.dart';
import 'package:poc_example_integration/screens/widgets/widget_search_not_found.dart';
import 'package:poc_example_integration/utils/colors.dart';

class SearchGifsPage extends StatefulWidget {
  @override
  _SearchGifsPageState createState() => _SearchGifsPageState();
}

class _SearchGifsPageState
    extends ModularState<SearchGifsPage, SearchGifsStore> {
  @override
  void initState() {
    super.initState();
    store.searchGifs('nazare');
    store.setSearchText('nazare');
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double lateralPadding = width > 1200 ? (width - 1200) / 2 : 32;

    return Scaffold(
      backgroundColor: greyOffWhite,
      body: Observer(
        builder: (context) {
          if (store.isLoading) {
            return Center(
              child: CircularProgressIndicator(color: aqua),
            );
          }
          if (store.gifs.isNotEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      GridView.builder(
                        padding: EdgeInsets.symmetric(
                          horizontal: lateralPadding,
                        ),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 250,
                          mainAxisExtent: 250,
                        ),
                        itemCount: store.gifs.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Container(
                              width: 260,
                              height: 240,
                              padding: EdgeInsets.all(30),
                              child: Image.network(store.gifs[index]),
                            ),
                          );
                        },
                      ),
                      WidgetLoadMore(
                        onTap: store.loadMoreGifs,
                        lateralPadding: lateralPadding,
                        isLoading: store.isLoadingMore,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }

          return WidgetSearchNotFound();
        },
      ),
    );
  }
}
