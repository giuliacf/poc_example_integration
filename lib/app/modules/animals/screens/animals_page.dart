import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_example_integration/app/modules/animals/repository/animals_store.dart';
import 'package:poc_example_integration/app/modules/animals/screens/widgets/animal_card.dart';
import 'package:poc_example_integration/screens/widgets/switchers/custom_switcher.dart';
import 'package:poc_example_integration/screens/widgets/texts/text_field_custom.dart';
import 'package:poc_example_integration/screens/widgets/widget_load_more.dart';
import 'package:poc_example_integration/screens/widgets/widget_search_not_found.dart';
import 'package:poc_example_integration/utils/colors.dart';
import 'package:poc_example_integration/utils/strings.dart';

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
    final double width = MediaQuery.of(context).size.width;
    final double lateralPadding = width > 1200 ? (width - 1200) / 2 : 32;

    return Scaffold(
      backgroundColor: greyOffWhite,
      body: Observer(
        builder: (context) {
          if (this.store.isLoading) {
            return Center(
              child: CircularProgressIndicator(color: aqua),
            );
          }
          if (this.store.animals.length > 0) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(
                    lateralPadding,
                    40,
                    lateralPadding,
                    0,
                  ),
                  child: CustomSwitcher(
                    openOrClosed: this.store.isDogApi,
                    onChanged: (val) async {
                      this.store.changeApi(val);
                      this.store.getApiData();
                    },
                    stringOpened: Strings.dogs,
                    widgetOpened:
                        Image.asset('assets/images/dog_toggle.png', width: 24),
                    stringClosed: Strings.cats,
                    widgetClosed:
                        Image.asset('assets/images/cat_toggle.png', width: 24),
                  ),
                ),
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
                        itemCount: this.store.animals.length,
                        itemBuilder: (context, index) {
                          return AnimalCard(
                            animal: this.store.animals[index],
                          );
                        },
                      ),
                      WidgetLoadMore(
                        onTap: () => this.store.getApiData(),
                        lateralPadding: lateralPadding,
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
