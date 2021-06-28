import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iupp_components/components/atoms/atoms.dart';

import 'package:poc_example_integration/app/modules/products/models/product_model.dart';
import 'package:poc_example_integration/app/modules/products/repository/products_store.dart';
import 'package:poc_example_integration/app/modules/products/screens/widgets/add_product_dialog.dart';
import 'package:poc_example_integration/app/modules/products/screens/widgets/product_card.dart';
import 'package:poc_example_integration/screens/widgets/switchers/custom_switcher.dart';
import 'package:poc_example_integration/screens/widgets/widget_search_not_found.dart';
import 'package:poc_example_integration/utils/colors.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final ProductsStore _store = Modular.get<ProductsStore>();

  @override
  void initState() {
    super.initState();
    _store.listProducts();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double lateralPadding = width > 1200 ? (width - 1200) / 2 : 32;

    return Scaffold(
      backgroundColor: greyOffWhite,
      body: Observer(
        builder: (context) {
          if (_store.queryLoading) {
            return Center(
              child: CircularProgressIndicator(color: aqua),
            );
          }

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
                  openOrClosed: _store.showPoints,
                  onChanged: (val) => _store.setShowPoints(value: val),
                  stringOpened: AppLocalizations.of(context)!.points,
                  widgetOpened: Icon(
                    IuppIcons.icone_solidos_P_programa_de_pontos,
                    color: white,
                    size: 24,
                  ),
                  stringClosed: AppLocalizations.of(context)!.card,
                  widgetClosed: Icon(
                    IuppIcons.icone_contorno_C_cartoes_outline,
                    color: white,
                    size: 24,
                  ),
                ),
              ),
              _store.productsFiltered.isNotEmpty
                  ? Expanded(
                      child: Scrollbar(
                        isAlwaysShown: true,
                        showTrackOnHover: true,
                        child: GridView.builder(
                          padding: EdgeInsets.symmetric(
                            horizontal: lateralPadding,
                          ),
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 280,
                            mainAxisExtent: 338,
                          ),
                          itemCount: _store.productsFiltered.length,
                          itemBuilder: (context, index) {
                            final Product _product =
                                _store.productsFiltered[index];
                            return ProductCard(
                              product: _product,
                              usePoints: _store.showPoints,
                            );
                          },
                        ),
                      ),
                    )
                  : WidgetSearchNotFound(),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: AppLocalizations.of(context)!.addProduct,
        backgroundColor: lead,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AddProductDialog(),
            barrierDismissible: false,
          );
        },
        child: Icon(
          IuppIcons.icone_solidos_M_mais,
          color: aqua,
        ),
      ),
    );
  }
}
