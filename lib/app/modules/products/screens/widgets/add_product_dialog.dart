import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iupp_components/iupp_components.dart';

import 'package:poc_example_integration/app/app_widget.dart';
import 'package:poc_example_integration/app/modules/products/repository/products_store.dart';
import 'package:poc_example_integration/screens/widgets/dialogs/warning_dialog.dart';
import 'package:poc_example_integration/screens/widgets/inputs/text_field_custom.dart';
import 'package:poc_example_integration/utils/colors.dart';
import 'package:poc_example_integration/utils/strings.dart';

class AddProductDialog extends StatelessWidget {
  final ProductsStore _store = Modular.get<ProductsStore>();

  Future<void> _onSubmitForm() async {
    if (!_store.isDisabled) {
      _store.addProduct();
      Modular.to.pop();
    }
  }

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
                  left: 24,
                  right: 24,
                  bottom: 24,
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
                              SizedBox(height: 18),
                              TextFieldCustom(
                                text: Strings.productName,
                                onChanged: _store.setProductName,
                                autofocus: true,
                                onFieldSubmitted: (value) => _onSubmitForm(),
                              ),
                              SizedBox(height: 16),
                              TextFieldCustom(
                                text: Strings.productDescription,
                                onChanged: _store.setProductDescription,
                                maxLines: 5,
                                keyboardType: TextInputType.multiline,
                                onFieldSubmitted: (value) => _onSubmitForm(),
                              ),
                              SizedBox(height: 16),
                              TextFieldCustom(
                                text: Strings.productPrice,
                                onFieldSubmitted: (value) => _onSubmitForm(),
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  CurrencyTextInputFormatter(
                                    decimalDigits: 2,
                                    symbol: '',
                                  )
                                ],
                                suffixIcon: Icon(
                                  IuppIcons.icone_contorno_C_consorcio_outline,
                                  size: 24,
                                  color: greyTwo,
                                ),
                                onChanged: (value) {
                                  _store.setProductPrice(
                                    _store.setProductPrice(
                                      value.isEmpty
                                          ? null
                                          : currencyFormatter
                                              .parse(value)
                                              .toDouble(),
                                    ),
                                  );
                                },
                              ),
                              SizedBox(height: 24),
                              SizedBox(
                                height: 48,
                                width: MediaQuery.of(context).size.width,
                                child: IuppElevatedButton(
                                  text: Strings.add,
                                  onPressed: !_store.isDisabled
                                      ? () {
                                          _store.addProduct();
                                          Modular.to.pop();
                                        }
                                      : null,
                                  isLoading: _store.saveLoading,
                                ),
                              ),
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
                child: Text(
                  Strings.addProduct,
                  style: IuppTextStyles.titleTitle5Bold,
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
