import 'package:flutter/material.dart';

import 'package:iupp_components/iupp_components.dart';

import 'package:poc_example_integration/utils/colors.dart';
import 'package:poc_example_integration/utils/strings.dart';

class WidgetLoadMore extends StatelessWidget {
  final Function onTap;
  final double lateralPadding;
  final bool isLoading;

  WidgetLoadMore({
    required this.onTap,
    required this.lateralPadding,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15),
        Container(
          padding: EdgeInsets.symmetric(horizontal: lateralPadding),
          child: MouseRegion(
            cursor: isLoading
                ? SystemMouseCursors.forbidden
                : SystemMouseCursors.click,
            child: GestureDetector(
              onTap: isLoading ? null : () => onTap(),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  isLoading ? Strings.loading : Strings.loadingMore,
                  style: IuppTextStyles.bodyBody1XBold.copyWith(
                    color: blue,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
