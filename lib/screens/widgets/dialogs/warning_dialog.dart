import 'package:flutter/material.dart';

import 'package:iupp_components/iupp_components.dart';

import 'package:poc_example_integration/utils/colors.dart';
import 'package:poc_example_integration/utils/strings.dart';

class WarningDialog extends StatelessWidget {
  final String content;
  final Function onSave;
  final Function onCancel;

  const WarningDialog({
    Key? key,
    required this.content,
    required this.onSave,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        '${Strings.warning}!',
        style: IuppTextStyles.textSmallBold,
      ),
      content: Text(
        content,
        style: IuppTextStyles.textSmallRegular,
      ),
      actions: [
        SizedBox(
          child: IuppElevatedButton(
            text: Strings.confirm,
            isLoading: false,
            textStyle: IuppTextStyles.textSmallBold.copyWith(
              color: aqua,
            ),
            onPressed: () {
              onSave();
            },
          ),
        ),
        SizedBox(
          width: 100,
          child: IuppTextButton(
            text: Strings.cancel,
            textStyle: IuppTextStyles.textSmallBold,
            onPressed: () {
              onCancel();
            },
          ),
        ),
      ],
    );
  }
}
