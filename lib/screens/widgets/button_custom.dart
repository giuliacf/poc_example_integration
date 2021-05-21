import 'package:flutter/material.dart';
import 'package:poc_example_integration/screens/widgets/text_custom.dart';
import 'package:poc_example_integration/utils/colors.dart';

class ButtonCustom extends StatelessWidget {
  ButtonCustom({
    required this.text,
    required this.onPressed,
    required this.isDisabled,
    required this.isLoading,
  });

  final String text;
  final Function onPressed;
  final bool isDisabled;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed as void Function()?,
      child: isLoading
          ? SizedBox(
              width: 10,
              height: 10,
              child: CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation<Color>(
                  white,
                ),
                strokeWidth: 2,
              ),
            )
          : TextCustom(
              text: text,
              fontSize: 18,
              textColor: !isDisabled ? black : grey,
              fontWeight: FontWeight.bold,
            ),
      style: OutlinedButton.styleFrom(
        backgroundColor: !isDisabled ? aqua : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(14),
          ),
        ),
      ),
    );
  }
}
