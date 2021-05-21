import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poc_example_integration/utils/colors.dart';

class TextFieldCustom extends StatelessWidget {
  final String text;
  final bool obscure;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String fontFamily;
  final List<TextInputFormatter>? inputFormatters;

  TextFieldCustom({
    required this.text,
    this.obscure = false,
    this.suffixIcon,
    this.onChanged,
    this.fontFamily = 'ItauDisplay',
    this.validator,
    this.controller,
    this.inputFormatters,
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
        color: greyThree,
      ),
      decoration: InputDecoration(
        enabledBorder: customBorder(grey),
        focusedBorder: customBorder(blue),
        errorBorder: customBorder(red),
        hintStyle: TextStyle(color: greyTwo),
        hintText: text,
        suffixIcon: suffixIcon,
      ),
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      validator: validator,
      controller: controller,
    );
  }
}
