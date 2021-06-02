import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poc_example_integration/utils/colors.dart';

class TextFieldCustom extends StatelessWidget {
  final String text;
  final String? placeholder;
  final bool obscure;
  final String? fontFamily;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final int maxLines;

  final String? errorText;

  TextFieldCustom({
    required this.text,
    this.obscure = false,
    this.suffixIcon,
    this.onChanged,
    this.fontFamily,
    this.inputFormatters,
    this.errorText,
    this.keyboardType,
    this.maxLines = 1,
    this.placeholder,
  });

  OutlineInputBorder customBorder(Color borderColor) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: greyTwo,
      obscureText: obscure,
      style: TextStyle(
        fontFamily: fontFamily,
        color: greyTwo,
      ),
      decoration: InputDecoration(
        enabledBorder: customBorder(grey),
        focusedBorder: customBorder(grey),
        errorBorder: customBorder(red),
        focusedErrorBorder: customBorder(red),
        labelText: text,
        labelStyle: TextStyle(color: greyFour, fontSize: 14),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintStyle: TextStyle(color: greyTwo),
        hintText: placeholder ?? text,
        errorText: errorText,
        suffixIcon: suffixIcon,
      ),
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      maxLines: maxLines,
      onChanged: onChanged,
    );
  }
}
