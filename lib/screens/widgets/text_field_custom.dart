import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poc_example_integration/utils/colors.dart';

class TextFieldCustom extends StatelessWidget {
  final String text;
  final bool obscure;
  final String fontFamily;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorText;

  TextFieldCustom({
    required this.text,
    this.obscure = false,
    this.suffixIcon,
    this.onChanged,
    this.fontFamily = 'ItauDisplay',
    this.inputFormatters,
    this.errorText,
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
        focusedBorder: customBorder(aqua),
        errorBorder: customBorder(red),
        focusedErrorBorder: customBorder(red),
        hintStyle: TextStyle(color: greyTwo),
        hintText: text,
        suffixIcon: suffixIcon,
        errorText: errorText,
      ),
      inputFormatters: inputFormatters,
      onChanged: onChanged,
    );
  }
}
