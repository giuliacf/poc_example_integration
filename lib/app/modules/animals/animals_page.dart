import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_example_integration/screens/body_screen_custom.dart';
import 'package:poc_example_integration/screens/widgets/buttons/standard_button.dart';
import 'package:poc_example_integration/screens/widgets/base_switcher.dart';
import 'package:poc_example_integration/screens/widgets/custom_switcher.dart';
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
    this.store.getApiData();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: greyOffWhite,
      body: BodyScreenCustom(
        body: Observer(
            builder: (_) => ListView(
                  children: [
                    CustomSwitcher(
                      openOrClosed: this.store.isDogApi,
                      onChanged: (val) async {
                        this.store.changeApi(val);
                        this.store.getApiData();
                      },
                      stringOpened: Strings.dogs,
                      widgetOpened: Image.asset('assets/images/dog_toogle.png',
                          width: 24),
                      stringClosed: Strings.dogs,
                      widgetClosed: Image.asset('assets/images/dog_toogle.png',
                          width: 24),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 250,
                        mainAxisExtent: 250,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: this.store.animals.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Container(
                            width: 255,
                            height: 240,
                            padding: EdgeInsets.all(30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Image.network(
                                    this.store.animals[index].photo,
                                    width: 70,
                                    height: 70,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                TextCustom(
                                  text: this.store.animals[index].name,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                TextCustom(
                                  text: Strings.lifeTime +
                                      this
                                          .store
                                          .animals[index]
                                          .lifeTime
                                          .replaceAll('years', '') +
                                      Strings.years,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ],
                            ),
                          )
                        );
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => this.store.getApiData(),
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
