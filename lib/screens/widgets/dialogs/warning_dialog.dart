import 'package:flutter/material.dart';
import 'package:poc_example_integration/screens/widgets/buttons/ghost_button.dart';
import 'package:poc_example_integration/screens/widgets/buttons/standard_button.dart';
import 'package:poc_example_integration/screens/widgets/texts/text_custom.dart';
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
      title: TextCustom(
        text: '${Strings.warning}!',
        fontWeight: FontWeight.w700,
      ),
      content: TextCustom(text: content),
      actions: [
        SizedBox(
          height: 35,
          width: 100,
          child: StandardButton(
            text: Strings.confirm,
            fontSize: 14,
            isDisabled: false,
            isLoading: false,
            onPressed: () {
              onSave();
            },
          ),
        ),
        SizedBox(
          height: 35,
          width: 90,
          child: GhostButton(
            text: Strings.cancel,
            fontSize: 14,
            isDisabled: false,
            isLoading: false,
            onPressed: () {
              onCancel();
            },
          ),
        ),
      ],
    );
  }
}
