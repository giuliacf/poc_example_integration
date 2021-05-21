import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_example_integration/app/modules/products/repository/products_store.dart';

class ProductForm extends StatefulWidget {
  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends ModularState<ProductForm, ProductsStore> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: this.store.loading
            ? CircularProgressIndicator()
            : Column(
                children: [
                  TextField(
                    controller: this.store.nameController,
                    decoration: InputDecoration(hintText: 'Insira o nome'),
                  ),
                  TextField(
                    controller: this.store.descriptionController,
                    decoration: InputDecoration(hintText: 'Insira a descrição'),
                  ),
                  TextField(
                    controller: this.store.priceController,
                    decoration: InputDecoration(hintText: 'Insira o preço'),
                  ),
                  SizedBox(height: 24),
                  Observer(
                    builder: (context) {
                      return ElevatedButton(
                        child: Text('Adicionar produto'),
                        onPressed: this.store.isDisabled
                            ? null
                            : () {
                                this.store.saveProdut();
                              },
                      );
                    },
                  )
                ],
              ),
      ),
    );
  }
}
