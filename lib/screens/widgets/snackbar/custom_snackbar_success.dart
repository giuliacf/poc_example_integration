import 'package:flutter/material.dart';

import 'package:iupp_components/components/atoms/atoms.dart';

import 'package:poc_example_integration/screens/widgets/snackbar/custom_snackbar.dart';
import 'package:poc_example_integration/utils/colors.dart';

class CustomSuccessSnackBar extends CustomSnackbar {
  CustomSuccessSnackBar(
    BuildContext context, {
    required String message,
  }) : super(
          context,
          message: message,
          icon: IuppIcons.icone_contorno_C_check,
          backgroundColor: green,
        );
}
