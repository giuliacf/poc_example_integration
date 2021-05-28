import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_example_integration/app/modules/products/repository/products_store.dart';
import 'package:poc_example_integration/app/modules/products/screens/widgets/warning_dialog.dart';
import 'package:poc_example_integration/screens/widgets/buttons/standard_button.dart';
import 'package:poc_example_integration/screens/widgets/text_custom.dart';
import 'package:poc_example_integration/screens/widgets/text_field_custom.dart';
import 'package:poc_example_integration/utils/colors.dart';
import 'package:poc_example_integration/utils/strings.dart';

class AddProductDialog extends StatelessWidget {
  final ProductsStore _store = Modular.get<ProductsStore>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(8),
        child: Stack(
          children: [
            Container(
              width: 400,
              padding: EdgeInsets.only(
                top: 54,
                left: 16,
                right: 16,
                bottom: 16,
              ),
              decoration: BoxDecoration(
                color: white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 0.0,
                    offset: Offset(0.0, 0.0),
                  ),
                ],
              ),
              child: Material(
                child: Form(
                  child: Container(
                    width: 400,
                    child: Observer(
                      builder: (context) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFieldCustom(
                              text: Strings.productPrice,
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              onChanged: (value) {
                                _store.setProductPrice(value.isEmpty ? null : double.parse(value));
                              },
                            ),
                            SizedBox(height: 8),
                            TextFieldCustom(
                              text: Strings.productName,
                              onChanged: _store.setProductName,
                            ),
                            SizedBox(height: 8),
                            TextFieldCustom(
                              text: Strings.productDescription,
                              onChanged: _store.setProductDescription,
                            ),
                            SizedBox(height: 24),
                            SizedBox(
                              height: 48,
                              width: MediaQuery.of(context).size.width,
                              child: StandardButton(
                                text: Strings.add,
                                isDisabled: _store.isDisabled,
                                isLoading: _store.saveLoading,
                                onPressed: () {
                                  _store.saveProduct();
                                  Modular.to.pop();
                                },
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, top: 16),
              child: TextCustom(
                text: Strings.addProduct,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            Positioned(
              top: 2,
              right: 2,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  onTap: () async {
                    final closeDialog = await showDialog(
                      context: context,
                      builder: (context) => WarningDialog(),
                    );

                    if (closeDialog) {
                      Modular.to.pop();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
