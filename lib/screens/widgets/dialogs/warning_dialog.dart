import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iupp_components/iupp_components.dart';

import 'package:poc_example_integration/utils/colors.dart';

class WarningDialog extends StatelessWidget {
  final String content;
  final Function()? onSave;
  final Function()? onCancel;

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
        '${AppLocalizations.of(context)!.warning}!',
        style: IuppTextStyles.textSmallBold,
      ),
      content: Text(
        content,
        style: IuppTextStyles.textSmallRegular,
      ),
      actions: [
        SizedBox(
          child: IuppElevatedButton(
            text: AppLocalizations.of(context)!.confirm,
            isLoading: false,
            textStyle: IuppTextStyles.textSmallBold.copyWith(
              color: aqua,
            ),
            onPressed: onSave,
          ),
        ),
        SizedBox(
          width: 100,
          child: IuppTextButton(
            text: AppLocalizations.of(context)!.cancel,
            textStyle: IuppTextStyles.textSmallBold,
            onPressed: onCancel,
          ),
        ),
      ],
    );
  }
}
