import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_example_integration/app/modules/animals/repository/animals_store.dart';
import 'package:poc_example_integration/app/modules/animals/screens/animals_page.dart';
import 'package:poc_example_integration/app/modules/app_bar/repository/app_bar_store.dart';
import 'package:poc_example_integration/app/modules/app_bar/screens/app_bar_page.dart';
import 'package:poc_example_integration/app/modules/products/repository/products_store.dart';
import 'package:poc_example_integration/app/modules/products/screens/products_page.dart';
import 'package:poc_example_integration/app/modules/search_gifs/repository/search_gifs_store.dart';
import 'package:poc_example_integration/app/modules/search_gifs/screens/search_gifs_page.dart';
import 'package:poc_example_integration/screens/widgets/texts/text_custom.dart';
import 'package:poc_example_integration/utils/colors.dart';
import 'package:poc_example_integration/utils/strings.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, AppBarStore> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) => Scaffold(
      backgroundColor: greyOffWhite,
      appBar: AppBarPage(currentPage: this.store.pageSelected,),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 2),
              decoration: BoxDecoration(
                border: Border.all(color: lead, width: 1),
                color: white,
              ),
              constraints: BoxConstraints(
                maxHeight: 52,
                maxWidth: 1200,
              ),
              child: Material(
                color: white,
                child: TabBar(
                  onTap: (index) => this.store.changeSelectedIndex(index),
                  labelStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                  unselectedLabelColor: lead,
                  labelColor: aqua,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: lead,
                  ),
                  tabs: [
                    Tab(text: Strings.products),
                    Tab(text: Strings.gifs),
                    Tab(text: Strings.animals)
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ProductsPage(),
                  SearchGifsPage(),
                  AnimalsPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    ),);
  }
}
