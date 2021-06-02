import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_example_integration/app/modules/products/models/product_model.dart';
import 'package:poc_example_integration/app/modules/products/repository/products_store.dart';
import 'package:poc_example_integration/screens/widgets/warning_dialog.dart';
import 'package:poc_example_integration/iupp_icons.dart';
import 'package:poc_example_integration/screens/widgets/text_custom.dart';
import 'package:poc_example_integration/utils/colors.dart';
import 'package:poc_example_integration/utils/strings.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    final ProductsStore _store = Modular.get<ProductsStore>();

    return Card(
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              child: Tooltip(
                message: Strings.removeProduct,
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => WarningDialog(
                        content: Strings.confirmDeleting,
                        onSave: () async {
                          await _store.deleteProduct(product.id, context);
                          Modular.to.pop();
                        },
                        onCancel: () {
                          Modular.to.pop();
                        },
                      ),
                    );
                  },
                  child: Icon(
                    IuppIcons.icone_contorno_E_excluir_outline,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 90,
                  child: Image.asset(
                    'assets/images/cellphone.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                SizedBox(height: 32),
                TextCustom(
                  text: product.name,
                  fontWeight: FontWeight.w700,
                  maxLines: 1,
                  textColor: greyTwo,
                  textOverflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8),
                TextCustom(
                  text: 'R\$ ${product.price}',
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(height: 8),
                TextCustom(
                  text: ' ganhe ${product.points} pts',
                  textColor: green,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
