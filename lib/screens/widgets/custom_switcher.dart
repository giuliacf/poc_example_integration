import 'package:flutter/material.dart';
import 'package:poc_example_integration/screens/widgets/text_custom.dart';
import 'package:poc_example_integration/utils/colors.dart';

import 'base_switcher.dart';

class CustomSwitcher extends StatelessWidget {
  final bool openOrClosed;
  final Function onChanged;
  final Widget widgetOpened;
  final Widget widgetClosed;
  final String stringOpened;
  final String stringClosed;

  CustomSwitcher({
    required this.openOrClosed,
    required this.onChanged,
    required this.widgetOpened,
    required this.widgetClosed,
    required this.stringOpened,
    required this.stringClosed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: 40,
      ),
      child: BaseSwitcher(
        open: openOrClosed,
        onChanged: (val) => onChanged(val),
        width: 127,
        height: 30,
        childOffset: 15,
        openColor: lead,
        color: lead,
        openChild: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            widgetOpened,
            SizedBox(width: 8),
            TextCustom(
              text: stringOpened,
              textColor: white,
              fontSize: 14,
              fontWeight: FontWeight.w800,
            )
          ],
        ),
        closeChild: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextCustom(
              text: stringClosed,
              textColor: white,
              fontSize: 14,
              fontWeight: FontWeight.w800,
            ),
            SizedBox(width: 8),
            widgetClosed
          ],
        ),
      ),
    );
  }
}
