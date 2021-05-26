import 'package:flutter/material.dart';
import 'package:poc_example_integration/app/modules/products/models/product_model.dart';
import 'package:poc_example_integration/screens/widgets/text_custom.dart';
import 'package:poc_example_integration/utils/colors.dart';

class ProductDetail extends StatelessWidget {
  final Product product;

  const ProductDetail({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.only(bottom: 16, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              child: Image.asset(
                'assets/images/product_placeholder.png',
                fit: BoxFit.fitHeight,
              ),
            ),
            TextCustom(
              text: 'R\$ ${product.price}',
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
            SizedBox(height: 8),
            TextCustom(
              text: product.name,
              maxLines: 1,
              textOverflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8),
            TextCustom(
              text: product.description,
              maxLines: 2,
              textColor: greyTwo,
              textOverflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
