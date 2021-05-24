import 'package:flutter/material.dart';
import 'package:poc_example_integration/iupp_icons.dart';
import 'package:poc_example_integration/screens/widgets/snackbar/custom_snackbar.dart';
import 'package:poc_example_integration/utils/colors.dart';

class CustomErrorSnackBar extends CustomSnackbar {
  CustomErrorSnackBar(
    BuildContext context, {
    required String message,
  }) : super(
          context,
          message: message,
          icon: IuppIcons.icone_contorno_A_aviso_outline,
          backgroundColor: red,
        );
}
