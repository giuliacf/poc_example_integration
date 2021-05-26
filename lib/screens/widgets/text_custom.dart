import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String fontFamily;
  final TextDecoration textDecoration;
  final TextOverflow? textOverflow;
  final int? maxLines;

  TextCustom({
    required this.text,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.fontFamily = 'ItauDisplay',
    this.textDecoration = TextDecoration.none,
    this.textOverflow,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverflow,
      maxLines: maxLines,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        decoration: textDecoration,
      ),
    );
  }
}
