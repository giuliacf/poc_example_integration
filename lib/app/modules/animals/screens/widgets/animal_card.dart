import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iupp_components/iupp_components.dart';

import 'package:poc_example_integration/app/modules/animals/models/animal.dart';
import 'package:poc_example_integration/utils/colors.dart';

class AnimalCard extends StatelessWidget {
  final Animal animal;

  AnimalCard({required this.animal});

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
            Text(
              animal.name,
              style: IuppTextStyles.textLargeXBold,
              maxLines: 2,
            ),
            SizedBox(height: 12),
            Text(
              AppLocalizations.of(context)!.lifeTime +
                  animal.lifeTime.replaceAll('years', '') +
                  AppLocalizations.of(context)!.years,
              style: IuppTextStyles.textMediumRegular,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
