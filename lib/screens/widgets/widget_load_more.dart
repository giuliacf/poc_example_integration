import 'package:flutter/material.dart';
import 'package:poc_example_integration/screens/widgets/texts/text_custom.dart';
import 'package:poc_example_integration/utils/colors.dart';
import 'package:poc_example_integration/utils/strings.dart';

class WidgetLoadMore extends StatelessWidget {
  final Function onTap;
  final double lateralPadding;

  WidgetLoadMore({
    required this.onTap,
    required this.lateralPadding
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: lateralPadding,
          ),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => onTap(),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextCustom(
                  text: Strings.loadingMore,
                  textColor: blue,
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
