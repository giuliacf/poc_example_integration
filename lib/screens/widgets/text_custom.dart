import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String fontFamily;

  TextCustom({
    required this.text,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.fontFamily = 'ItauDisplay'
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily
      ),
    );
  }
}
