import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_example_integration/app/app_widget.dart';
import 'package:poc_example_integration/app/modules/products/repository/products_store.dart';
import 'package:poc_example_integration/iupp_icons.dart';
import 'package:poc_example_integration/screens/widgets/dialogs/warning_dialog.dart';
import 'package:poc_example_integration/screens/widgets/buttons/standard_button.dart';
import 'package:poc_example_integration/screens/widgets/texts/text_custom.dart';
import 'package:poc_example_integration/screens/widgets/texts/text_field_custom.dart';
import 'package:poc_example_integration/utils/colors.dart';
import 'package:poc_example_integration/utils/strings.dart';

class AddProductDialog extends StatelessWidget {
  final ProductsStore _store = Modular.get<ProductsStore>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(8),
          child: Stack(
            children: [
              Container(
                width: 376,
                padding: EdgeInsets.only(
                  top: 54,
                  left: 32,
                  right: 32,
                  bottom: 32,
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
                      width: 376,
                      color: white,
                      child: Observer(
                        builder: (context) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: 32),
                              TextFieldCustom(
                                text: Strings.productName,
                                onChanged: _store.setProductName,
                                autofocus: true,
                              ),
                              SizedBox(height: 32),
                              TextFieldCustom(
                                text: Strings.productDescription,
                                onChanged: _store.setProductDescription,
                                maxLines: 5,
                                keyboardType: TextInputType.multiline,
                              ),
                              SizedBox(height: 32),
                              TextFieldCustom(
                                text: Strings.productPrice,
                                suffixIcon: Icon(
                                  IuppIcons.icone_contorno_C_consorcio_outline,
                                  size: 24,
                                  color: greyTwo,
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  CurrencyTextInputFormatter(
                                    decimalDigits: 2,
                                    symbol: '',
                                  )
                                ],
                                onChanged: (value) {
                                  _store.setProductPrice(_store.setProductPrice(
                                    value.isEmpty
                                        ? null
                                        : currencyFormatter.parse(value).toDouble(),
                                  ));
                                },
                              ),
                              SizedBox(height: 48),
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
                padding: EdgeInsets.only(
                  left: 32,
                  top: 32,
                  bottom: 32,
                ),
                child: TextCustom(
                  text: Strings.addProduct,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Positioned(
                top: 20,
                right: 20,
                child: Tooltip(
                  message: Strings.close,
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Icon(Icons.close),
                        ),
                      ),
                      onTap: () async {
                        final closeDialog = await showDialog(
                          context: context,
                          builder: (context) => WarningDialog(
                            content: Strings.cancelEditWarning,
                            onSave: () {
                              Modular.to.pop(true);
                            },
                            onCancel: () {
                              Modular.to.pop(false);
                            },
                          ),
                        );

                        if (closeDialog) {
                          Modular.to.pop();
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
