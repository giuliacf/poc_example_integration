import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? fontSize;
  final TextDecoration textDecoration;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final TextOverflow? textOverflow;
  final int? maxLines;
  final Key? key;

  TextCustom({
    required this.text,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.fontFamily,
    this.textDecoration = TextDecoration.none,
    this.textOverflow,
    this.maxLines,
    this.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      key: key,
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
