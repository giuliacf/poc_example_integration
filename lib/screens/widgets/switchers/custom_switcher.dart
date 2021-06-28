import 'package:flutter/material.dart';

import 'package:iupp_components/iupp_components.dart';

import 'package:poc_example_integration/utils/colors.dart';
import 'base_switcher.dart';

class CustomSwitcher extends StatelessWidget {
  final bool openOrClosed;
  final Function(bool) onChanged;
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
        onChanged: onChanged,
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
            Text(
              stringOpened,
              style: IuppTextStyles.textSmallBold.copyWith(
                color: white,
              ),
            )
          ],
        ),
        closeChild: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              stringClosed,
              style: IuppTextStyles.textSmallBold.copyWith(
                color: white,
              ),
            ),
            SizedBox(width: 8),
            widgetClosed
          ],
        ),
      ),
    );
  }
}
