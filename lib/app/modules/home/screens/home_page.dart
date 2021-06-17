import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_example_integration/app/core/data/auth_datasource.dart';
import 'package:poc_example_integration/app/modules/animals/screens/animals_page.dart';
import 'package:poc_example_integration/app/modules/home/repository/home_store.dart';
import 'package:poc_example_integration/app/modules/home/widgets/appbar/app_bar_widget.dart';
import 'package:poc_example_integration/app/modules/products/screens/products_page.dart';
import 'package:poc_example_integration/app/modules/search_gifs/screens/search_gifs_page.dart';
import 'package:poc_example_integration/utils/colors.dart';
import 'package:poc_example_integration/utils/strings.dart';

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  final AuthDatasource authDatasource = Modular.get<AuthDatasource>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyOffWhite,
      appBar: AppBarWidget(
        homeStore: store,
        authDatasource: authDatasource,
      ),
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
                  onTap: (index) => store.changeSelectedIndex(index),
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
    );
  }
}
