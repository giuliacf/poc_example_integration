import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iupp_components/components/atoms/atoms.dart';
import 'package:iupp_components/iupp_components.dart';

import 'package:poc_example_integration/app/app_widget.dart';
import 'package:poc_example_integration/app/modules/products/models/product_model.dart';
import 'package:poc_example_integration/app/modules/products/repository/products_store.dart';
import 'package:poc_example_integration/screens/widgets/dialogs/warning_dialog.dart';
import 'package:poc_example_integration/utils/colors.dart';

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
                    product.image,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  product.name,
                  style: IuppTextStyles.textLargeBold,
                  maxLines: 1,
                ),
                SizedBox(height: 8),
                SizedBox(
                  height: 40,
                  child: Text(
                    product.description ?? '',
                    style: IuppTextStyles.textMediumBold.copyWith(
                      color: greyTwo,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 16),
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 500),
                  child: usePoints
                      ? Container(
                          key: UniqueKey(),
                          height: 63,
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${numberFormatter.format(product.points)} pts',
                                overflow: TextOverflow.ellipsis,
                                style: IuppTextStyles.textMediumBold,
                              ),
                              Text(
                                AppLocalizations.of(context)!.usePointsAndMoney,
                                style: IuppTextStyles.textMediumBold.copyWith(
                                  color: green,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        )
                      : Container(
                          alignment: Alignment.topLeft,
                          key: UniqueKey(),
                          height: 63,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '''R\$ ${currencyFormatter.format(product.price)}''',
                                style: IuppTextStyles.textMediumBold,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                AppLocalizations.of(context)!.winSomePoints(
                                  numberFormatter.format(product.points),
                                ),
                                style: IuppTextStyles.textMediumBold.copyWith(
                                  color: green,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                ),
              ],
            ),
            Positioned(
              right: 0,
              child: Tooltip(
                message: AppLocalizations.of(context)!.removeProduct,
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => WarningDialog(
                        content: AppLocalizations.of(context)!.confirmDeleting,
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
