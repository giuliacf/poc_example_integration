import 'package:flutter/material.dart';
import 'package:poc_example_integration/screens/widgets/texts/text_custom.dart';
import 'package:poc_example_integration/utils/colors.dart';
import 'package:poc_example_integration/utils/strings.dart';

class WidgetSearchNotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 540,
        height: 80,
        decoration: BoxDecoration(
            border: Border.all(color: grey),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/sad_face.png', width: 25),
            TextCustom(
              text: Strings.searchNotFound,
              textColor: bluePool,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            )
          ],
        ),
      ),
    );
  }
}
