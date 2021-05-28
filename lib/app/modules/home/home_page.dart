import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_example_integration/app/modules/home/home_store.dart';
import 'package:poc_example_integration/iupp_icons.dart';
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
            textColor: white,
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
        body: this.store.screens[this.store.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: lead,
          unselectedItemColor: grey,
          currentIndex: this.store.currentIndex,
          onTap: this.store.changePage,
          items: [
            BottomNavigationBarItem(
              icon: Icon(IuppIcons.icone_solidos_B_bike),
              label: Strings.products,
            ),
            BottomNavigationBarItem(
              icon: Icon(IuppIcons.icone_solidos_A_antecipacao_de_recebimento),
              label: Strings.searchGifs,
            ),
          ],
        ),
      ),
    );
  }
}
