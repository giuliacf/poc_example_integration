import 'package:flutter/material.dart';
import 'package:poc_example_integration/screens/widgets/text_custom.dart';
import 'package:poc_example_integration/utils/colors.dart';

class ButtonCustom extends StatelessWidget {
  ButtonCustom({
    required this.text,
    required this.onPressed,
    required this.isDisabled,
    required this.isLoading,
    required this.backgroundColor,
    required this.textColor,
  });

  final String text;
  final void Function()? onPressed;
  final bool isDisabled;
  final bool isLoading;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: isDisabled ? null : onPressed,
      child: isLoading
          ? SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation<Color>(
                  textColor,
                ),
                strokeWidth: 4,
              ),
            )
          : TextCustom(
              text: text,
              fontSize: 18,
              textColor: !isDisabled ? textColor : grey,
              fontWeight: FontWeight.bold,
            ),
      style: OutlinedButton.styleFrom(
        backgroundColor: !isDisabled ? backgroundColor : Colors.transparent,
        side: BorderSide(
          width: 1,
          color: !isDisabled ? Colors.transparent : grey,
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: aqua, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
      ),
    );
  }
}
