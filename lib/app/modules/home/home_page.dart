import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_example_integration/app/modules/home/home_store.dart';
import 'package:poc_example_integration/utils/strings.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        appBar: AppBar(),
        body: this.store.screens[this.store.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: this.store.currentIndex,
          onTap: this.store.changePage,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: Strings.products,
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.shopping_basket),
            //   label: Strings.searchGifs,
            // ),
          ],
        ),
      ),
    );
  }
}
