import 'package:flutter/material.dart';
import 'package:poc_example_integration/screens/widgets/texts/text_custom.dart';
import 'package:poc_example_integration/utils/colors.dart';
import 'package:poc_example_integration/utils/strings.dart';

class WidgetSearchNotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 80,
        padding: EdgeInsets.symmetric(horizontal: 18),
        margin: EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: white,
          border: Border.all(color: grey),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 16,
              offset: Offset(0, 0),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/sad_face.png', width: 30),
            SizedBox(width: 18),
            Flexible(
              child: TextCustom(
                text: Strings.searchNotFound,
                textColor: bluePool,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
