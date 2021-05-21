import 'package:flutter/material.dart';
import 'package:poc_example_integration/app/modules/products/screens/product_form.dart';

class AddProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar produto'),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: ProductForm(),
        ),
      ),
    );
  }
}
