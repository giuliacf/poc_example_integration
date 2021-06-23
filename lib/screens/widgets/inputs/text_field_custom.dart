import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:iupp_components/iupp_components.dart';

import 'package:poc_example_integration/utils/colors.dart';

class TextFieldCustom extends StatelessWidget {
  final String? text;
  final String? placeholder;
  final bool obscure;
  final bool autofocus;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final int maxLines;
  final FloatingLabelBehavior floatingLabelBehavior;
  final Function(String)? onFieldSubmitted;

  final String? errorText;

  TextFieldCustom({
    required this.text,
    this.obscure = false,
    this.suffixIcon,
    this.onChanged,
    this.inputFormatters,
    this.errorText,
    this.keyboardType,
    this.maxLines = 1,
    this.placeholder,
    this.floatingLabelBehavior = FloatingLabelBehavior.always,
    this.prefixIcon,
    this.autofocus = false,
    this.controller,
    this.onFieldSubmitted,
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
      textAlignVertical: TextAlignVertical.center,
      cursorColor: greyTwo,
      obscureText: obscure,
      autofocus: autofocus,
      controller: controller,
      style: IuppTextStyles.textSmallRegular.copyWith(
        color: greyTwo,
      ),
      decoration: InputDecoration(
        enabledBorder: customBorder(grey),
        focusedBorder: customBorder(grey),
        errorBorder: customBorder(red),
        focusedErrorBorder: customBorder(red),
        labelText: text,
        labelStyle: TextStyle(
          color: greyFour,
          fontSize: 18,
        ),
        floatingLabelBehavior: floatingLabelBehavior,
        hintStyle: TextStyle(color: greyTwo),
        hintText: placeholder ?? text,
        errorText: errorText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      maxLines: maxLines,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
