import 'package:flutter/material.dart';

class CustomSnackbar extends SnackBar {
  CustomSnackbar(
    BuildContext context, {
    required String message,
    required IconData icon,
    required Color backgroundColor,
  }) : super(
          content: Text(
            message,
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: backgroundColor,
          width: 315,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          behavior: SnackBarBehavior.floating,
        );
}
