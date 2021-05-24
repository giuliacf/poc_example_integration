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

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo é obrigatório';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: this.store.loading
            ? CircularProgressIndicator()
            : Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFieldCustom(
                      controller: this.store.nameController,
                      text: 'Insira o nome do produto',
                      validator: _validator,
                    ),
                    SizedBox(height: 8),
                    TextFieldCustom(
                      controller: this.store.descriptionController,
                      text: 'Insira a descrição do produto',
                      validator: _validator,
                    ),
                    SizedBox(height: 8),
                    TextFieldCustom(
                      controller: this.store.priceController,
                      text: 'Insira o preço do produto',
                      validator: _validator,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                    SizedBox(height: 24),
                    Observer(
                      builder: (context) {
                        return ButtonCustom(
                          text: 'Adicionar',
                          isDisabled: false,
                          isLoading: this.store.loading,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              this.store.saveProdut();
                            }
                          },
                        );
                      },
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
