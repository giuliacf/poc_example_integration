import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_example_integration/app/modules/products/screens/products_page.dart';
import 'package:poc_example_integration/app/modules/search_gifs/search_gifs_page.dart';
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
            child: Container(
              margin: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 58,
                    width: 89,
                  )
                ],
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: IconButton(
              tooltip: Strings.logout,
              icon: Icon(IuppIcons.icone_solidos_S_sair, color: white),
              onPressed: () {
                Modular.to.navigate('/login');
              },
            ),
          )
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 2),
              decoration: BoxDecoration(
                border: Border.all(color: lead, width: 1),
              ),
              constraints: BoxConstraints(maxHeight: 52),
              child: Material(
                color: white,
                child: TabBar(
                  labelStyle: TextStyle(
                    fontSize: 24,
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
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ProductsPage(),
                  SearchGifsPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
