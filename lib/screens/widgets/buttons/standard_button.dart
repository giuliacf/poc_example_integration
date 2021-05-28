import 'package:flutter/material.dart';
import 'package:poc_example_integration/screens/widgets/buttons/button_custom.dart';
import 'package:poc_example_integration/utils/colors.dart';

class StandardButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final bool isDisabled;
  final bool isLoading;

  StandardButton({
    required this.text,
    required this.onPressed,
    required this.isDisabled,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonCustom(
      text: text,
      onPressed: onPressed,
      isDisabled: isDisabled,
      isLoading: isLoading,
      backgroundColor: lead,
      textColor: aqua,
    );
  }
}
