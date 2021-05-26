import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_example_integration/app/modules/products/repository/products_store.dart';
import 'package:poc_example_integration/screens/widgets/button_custom.dart';
import 'package:poc_example_integration/screens/widgets/text_field_custom.dart';
import 'package:poc_example_integration/utils/colors.dart';

class AddProductDialog extends StatelessWidget {
  final ProductsStore _store = Modular.get<ProductsStore>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Novo produto',
        style: TextStyle(color: white),
      ),
      content: Form(
        child: Container(
          width: 400,
          child: Observer(
            builder: (context) {
              return Column(
                children: [
                  TextFieldCustom(
                    text: 'Nome do produto',
                    onChanged: _store.setProductName,
                  ),
                  SizedBox(height: 8),
                  TextFieldCustom(
                    text: 'Descrição do produto',
                    onChanged: _store.setProductDescription,
                  ),
                  SizedBox(height: 8),
                  TextFieldCustom(
                    text: 'Preço do produto',
                    onChanged: (value) {
                      _store.setProductPrice(double.parse(value));
                    },
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                  SizedBox(height: 24),
                  SizedBox(
                    height: 48,
                    width: MediaQuery.of(context).size.width,
                    child: ButtonCustom(
                      text: 'Adicionar',
                      isDisabled: false,
                      isLoading: _store.loading,
                      onPressed: () {
                        _store.saveProdut();
                      },
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
