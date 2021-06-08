import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_example_integration/app/core/data/auth_datasource.dart';
import 'package:poc_example_integration/app/modules/animals/screens/animals_page.dart';
import 'package:poc_example_integration/app/modules/products/screens/products_page.dart';
import 'package:poc_example_integration/app/modules/search_gifs/screens/search_gifs_page.dart';
import 'package:poc_example_integration/iupp_icons.dart';
import 'package:poc_example_integration/utils/colors.dart';
import 'package:poc_example_integration/utils/strings.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final authDatasource = Modular.get<AuthDatasource>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        title: Align(
          alignment: Alignment.center,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 1200),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 58,
                  width: 89,
                ),
                IconButton(
                  tooltip: Strings.logout,
                  icon: Icon(
                    IuppIcons.icone_solidos_S_sair,
                    color: aqua,
                    size: 24,
                  ),
                  onPressed: () async => await authDatasource.logout(),
                ),
              ],
            ),
          ),
        ),
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
              constraints: BoxConstraints(maxHeight: 52),
              child: Material(
                color: white,
                child: TabBar(
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
                  AnimalsPage()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
