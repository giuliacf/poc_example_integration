import 'package:flutter/material.dart';
import 'package:poc_example_integration/app/modules/products/screens/product_form.dart';

class AddProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ProductForm(),
      ),
    );
  }
}
