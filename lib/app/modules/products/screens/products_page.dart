import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_example_integration/app/modules/products/models/product_model.dart';
import 'package:poc_example_integration/app/modules/products/repository/products_store.dart';
import 'package:poc_example_integration/app/modules/products/screens/widgets/add_product_dialog.dart';
import 'package:poc_example_integration/app/modules/products/screens/widgets/product_detail.dart';
import 'package:poc_example_integration/iupp_icons.dart';
import 'package:poc_example_integration/screens/widgets/text_custom.dart';
import 'package:poc_example_integration/utils/colors.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final ProductsStore _store = Modular.get<ProductsStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text(
          'Produtos',
          style: TextStyle(color: bluePool),
        ),
        backgroundColor: aqua,
      ),
      body: Observer(
        builder: (context) {
          if (_store.products.length > 0) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250,
                mainAxisExtent: 250,
              ),
              itemCount: _store.products.length,
              itemBuilder: (context, index) {
                final Product _product = _store.products[index];
                return ProductDetail(product: _product);
              },
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
                  text: 'opps! \nnão conseguimos \nencontrar nenhum \nproduto',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                )
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Adicionar produto',
        backgroundColor: aqua,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AddProductDialog(),
          );
        },
        child: Icon(
          Icons.add,
          color: bluePool,
        ),
      ),
    );
  }
}
