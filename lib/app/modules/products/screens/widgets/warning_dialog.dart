import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_example_integration/screens/widgets/buttons/ghost_button.dart';
import 'package:poc_example_integration/screens/widgets/buttons/standard_button.dart';
import 'package:poc_example_integration/screens/widgets/text_custom.dart';
import 'package:poc_example_integration/utils/strings.dart';

class WarningDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: TextCustom(
        text: '${Strings.warning}!',
        fontWeight: FontWeight.w700,
      ),
      content: TextCustom(text: 'Você deseja realmente sair? \nOs dados não serão salvos.'),
      actions: [
        SizedBox(
          height: 35,
          width: 90,
          child: StandardButton(
            text: 'Sair',
            isDisabled: false,
            isLoading: false,
            onPressed: () {
              Modular.to.pop(true);
            },
          ),
        ),
        SizedBox(
          height: 35,
          width: 90,
          child: GhostButton(
            text: 'Cancelar',
            isDisabled: false,
            isLoading: false,
            onPressed: () {
              Modular.to.pop(false);
            },
          ),
        ),
      ],
    );
  }
}
