import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_example_integration/app/modules/products/models/product_model.dart';
import 'package:poc_example_integration/app/modules/products/repository/products_store.dart';
import 'package:poc_example_integration/app/modules/products/screens/widgets/add_product_dialog.dart';
import 'package:poc_example_integration/app/modules/products/screens/widgets/product_card.dart';
import 'package:poc_example_integration/iupp_icons.dart';
import 'package:poc_example_integration/screens/body_screen_custom.dart';
import 'package:poc_example_integration/screens/widgets/custom_switcher.dart';
import 'package:poc_example_integration/screens/widgets/text_custom.dart';
import 'package:poc_example_integration/utils/colors.dart';
import 'package:poc_example_integration/utils/strings.dart';

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
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: greyOffWhite,
      body: BodyScreenCustom(
        body: Observer(
          builder: (context) {
            if (_store.queryLoading) {
              return Center(
                child: CircularProgressIndicator(color: aqua),
              );
            }
            if (_store.products.length > 0) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 40,
                      horizontal: width > 1200 ? 0 : 32,
                    ),
                    child: CustomSwitcher(
                        open: _store.showPoints,
                        onChanged: (val) {
                          _store.setShowPoints(val);
                        },
                        width: 127,
                        height: 30,
                        childOffset: 15,
                        openColor: lead,
                        color: lead,
                        openChild: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              IuppIcons.icone_solidos_P_programa_de_pontos,
                              color: white,
                              size: 24,
                            ),
                            SizedBox(width: 8),
                            TextCustom(
                              text: Strings.points,
                              textColor: white,
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                            )
                          ],
                        ),
                        closeChild: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextCustom(
                              text: Strings.card,
                              textColor: white,
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                            ),
                            SizedBox(width: 8),
                            Icon(
                              IuppIcons.icone_contorno_C_cartoes_outline,
                              color: white,
                              size: 24,
                            ),
                          ],
                        )),
                  ),
                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: width > 1200 ? 0 : 32),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 280,
                        mainAxisExtent: 338,
                      ),
                      itemCount: _store.products.length,
                      itemBuilder: (context, index) {
                        final Product _product = _store.products[index];
                        return ProductCard(
                          product: _product,
                          usePoints: _store.showPoints,
                        );
                      },
                    ),
                  ),
                ],
              );
            }

            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    IuppIcons.icone_contorno_F_fechar,
                    size: 40,
                    color: red,
                  ),
                  TextCustom(
                    text: Strings.productNotFound,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  )
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: Strings.addProduct,
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
