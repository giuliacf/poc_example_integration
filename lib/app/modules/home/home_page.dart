import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_example_integration/app/modules/home/home_store.dart';
import 'package:poc_example_integration/screens/widgets/text_custom.dart';
import 'package:poc_example_integration/utils/colors.dart';
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
        appBar: AppBar(
          title: TextCustom(
            text: this.store.currentPage,
            textColor: bluePool,
          ),
          backgroundColor: aqua,
          actions: [
            Padding(
              padding: EdgeInsets.all(20),
              child: InkWell(
                child: TextCustom(
                  text: Strings.out,
                  textColor: bluePool,
                ),
                onTap:() => Modular.to.navigate('/login'),
              ),
            )
          ],
        ),
        body: this.store.screens[this.store.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: this.store.currentIndex,
          onTap: this.store.changePage,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket),
              label: Strings.products,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.all_inclusive),
              label: Strings.searchGifs,
            ),
          ],
        ),
      ),
    );
  }
}
