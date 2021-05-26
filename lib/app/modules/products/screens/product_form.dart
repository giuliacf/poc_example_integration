import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_example_integration/app/modules/products/repository/products_store.dart';
import 'package:poc_example_integration/screens/widgets/button_custom.dart';
import 'package:poc_example_integration/screens/widgets/text_field_custom.dart';

class ProductForm extends StatefulWidget {
  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends ModularState<ProductForm, ProductsStore> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: this.store.loading
            ? CircularProgressIndicator()
            : Form(
                key: _formKey,
                child: Container(
                  width: 400,
                  child: Column(
                    children: [
                      TextFieldCustom(
                        text: 'Insira o nome do produto',
                      ),
                      SizedBox(height: 8),
                      TextFieldCustom(
                        text: 'Insira a descrição do produto',
                      ),
                      SizedBox(height: 8),
                      TextFieldCustom(
                        text: 'Insira o preço do produto',
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      ),
                      SizedBox(height: 24),
                      Observer(
                        builder: (context) {
                          return SizedBox(
                            height: 48,
                            width: MediaQuery.of(context).size.width,
                            child: ButtonCustom(
                              text: 'Adicionar',
                              isDisabled: false,
                              isLoading: this.store.loading,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  this.store.saveProdut();
                                }
                              },
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
