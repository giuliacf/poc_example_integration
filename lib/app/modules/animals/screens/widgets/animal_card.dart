import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:poc_example_integration/app/modules/animals/models/animal.dart';
import 'package:poc_example_integration/screens/widgets/texts/text_custom.dart';
import 'package:poc_example_integration/utils/colors.dart';
import 'package:poc_example_integration/utils/strings.dart';

class AnimalCard extends StatelessWidget {
  final Animal animal;

  AnimalCard({
    required this.animal,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 255,
        height: 240,
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CachedNetworkImage(
                placeholder: (context, url) => Container(
                  padding: EdgeInsets.all(18),
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(color: lightGrey),
                ),
                imageUrl: animal.photo,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 12),
            TextCustom(
              text: animal.name,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
            SizedBox(height: 12),
            TextCustom(
              text: Strings.lifeTime +
                  animal.lifeTime.replaceAll('years', '') +
                  Strings.years,
              fontWeight: FontWeight.w400,
              fontSize: 16,
              textOverflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
