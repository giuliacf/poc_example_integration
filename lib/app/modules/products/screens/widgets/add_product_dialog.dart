import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_example_integration/app/modules/products/repository/products_store.dart';
import 'package:poc_example_integration/screens/widgets/button_custom.dart';
import 'package:poc_example_integration/screens/widgets/text_field_custom.dart';
import 'package:poc_example_integration/utils/colors.dart';
import 'package:poc_example_integration/utils/strings.dart';

class AddProductDialog extends StatelessWidget {
  final ProductsStore _store = Modular.get<ProductsStore>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        Strings.newProduct,
        style: TextStyle(color: white),
      ),
      backgroundColor: lead,
      content: Form(
        child: Container(
          width: 400,
          child: Observer(
            builder: (context) {
              return Column(
                children: [
                  TextFieldCustom(
                    text: Strings.productName,
                    onChanged: _store.setProductName,
                  ),
                  SizedBox(height: 8),
                  TextFieldCustom(
                    text: Strings.productDescription,
                    onChanged: _store.setProductDescription,
                  ),
                  SizedBox(height: 8),
                  TextFieldCustom(
                    text: Strings.productPrice,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (value) {
                      _store.setProductPrice(value.isEmpty ? null : double.parse(value));
                    },
                  ),
                  SizedBox(height: 24),
                  SizedBox(
                    height: 48,
                    width: MediaQuery.of(context).size.width,
                    child: ButtonCustom(
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
    );
  }
}
