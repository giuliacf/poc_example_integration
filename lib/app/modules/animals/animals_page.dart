import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_example_integration/screens/body_screen_custom.dart';
import 'package:poc_example_integration/screens/widgets/buttons/standard_button.dart';
import 'package:poc_example_integration/screens/widgets/text_custom.dart';
import 'package:poc_example_integration/utils/colors.dart';
import 'package:poc_example_integration/utils/strings.dart';

import 'animals_store.dart';

class AnimalsPage extends StatefulWidget {
  @override
  _AnimalsPageState createState() => _AnimalsPageState();
}

class _AnimalsPageState extends ModularState<AnimalsPage, AnimalsStore> {
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
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250,
                  mainAxisExtent: 250,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: this.store.dogs.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          this.store.dogs[index].photo,
                          width: 100,
                          height: 100,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextCustom(text: this.store.dogs[index].name),
                        SizedBox(
                          height: 5,
                        ),
                        TextCustom(
                          text: Strings.lifeTime +
                              this.store.dogs[index].life.replaceAll('years', '') +
                              Strings.years,
                        ),
                      ],
                    ),
                  );
                },
              ),
              StandardButton(
                text: Strings.loadingMore,
                onPressed: this.store.searchGifs,
                isDisabled: false,
                isLoading: false,
              )
            ],
          )
        ),
      ),
    );
  }
}
