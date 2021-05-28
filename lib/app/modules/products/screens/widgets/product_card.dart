import 'package:flutter/material.dart';
import 'package:poc_example_integration/app/modules/products/models/product_model.dart';
import 'package:poc_example_integration/screens/widgets/text_custom.dart';
import 'package:poc_example_integration/utils/colors.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              height: 90,
              child: Image.asset(
                'assets/images/cellphone.png',
                fit: BoxFit.fitHeight,
              ),
            ),
            SizedBox(height: 32),
            TextCustom(
              text: product.name,
              fontWeight: FontWeight.w700,
              maxLines: 1,
              textColor: greyTwo,
              textOverflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8),
            TextCustom(
              text: 'R\$ ${product.price}',
              fontWeight: FontWeight.w700,
            ),
            SizedBox(height: 8),
            TextCustom(
              text: ' ganhe ${product.points} pts',
              textColor: green,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
      ),
    );
  }
}
