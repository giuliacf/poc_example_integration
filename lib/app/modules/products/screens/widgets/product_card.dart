import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_example_integration/app/app_widget.dart';
import 'package:poc_example_integration/app/modules/products/models/product_model.dart';
import 'package:poc_example_integration/app/modules/products/repository/products_store.dart';
import 'package:poc_example_integration/screens/widgets/warning_dialog.dart';
import 'package:poc_example_integration/iupp_icons.dart';
import 'package:poc_example_integration/screens/widgets/text_custom.dart';
import 'package:poc_example_integration/utils/colors.dart';
import 'package:poc_example_integration/utils/strings.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final bool usePoints;

  const ProductCard({
    required this.product,
    required this.usePoints,
  });

  @override
  Widget build(BuildContext context) {
    final ProductsStore _store = Modular.get<ProductsStore>();

    return Card(
      elevation: 3,
      color: white,
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 110,
                  child: Image.asset(
                    'assets/images/cellphone.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                SizedBox(height: 16),
                TextCustom(
                  text: product.name,
                  maxLines: 1,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(height: 8),
                SizedBox(
                  height: 40,
                  child: TextCustom(
                    text: product.description ?? '',
                    textColor: greyTwo,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    maxLines: 2,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 16),
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 500),
                  child: usePoints
                      ? TextCustom(
                          key: UniqueKey(),
                          text: '${numberFormatter.format(product.points)} pts',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          textOverflow: TextOverflow.ellipsis,
                        )
                      : TextCustom(
                          key: UniqueKey(),
                          text: 'R\$ ${currencyFormatter.format(product.price)}',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                ),
                AnimatedSwitcher(
                  child: usePoints
                      ? TextCustom(
                          key: UniqueKey(),
                          text: Strings.usePointsAndMoney,
                          textColor: green,
                          fontSize: 16,
                          maxLines: 2,
                          fontWeight: FontWeight.w700,
                          textOverflow: TextOverflow.ellipsis,
                        )
                      : TextCustom(
                          key: UniqueKey(),
                          text: Strings.winSomePoints(numberFormatter.format(product.points)),
                          textColor: green,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                  duration: Duration(milliseconds: 500),
                ),
              ],
            ),
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
                  child: Icon(IuppIcons.icone_contorno_E_excluir_outline),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
