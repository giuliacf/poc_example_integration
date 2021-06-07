import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:poc_example_integration/screens/widgets/snackbar/custom_snackbar_success.dart';
import 'package:poc_example_integration/utils/regex.dart';
import 'package:poc_example_integration/utils/strings.dart';

part 'forget_password_store.g.dart';

class ForgetPasswordStore = _ForgetPasswordStore with _$ForgetPasswordStore;

abstract class _ForgetPasswordStore with Store {

  @observable
  String email = '';

  @observable
  String confirmEmail = '';

  @action
  void setEmail(String value) => email = value;

  @action
  void setConfirmEmail(String value) => confirmEmail = value;

  @computed
  bool get canLogin => email.isNotEmpty && confirmEmail.isNotEmpty;

  @computed
  bool get isEmailValid => RegExp(emailRegex).hasMatch(email);

  @computed
  bool get isConfirmEmailValid => RegExp(emailRegex).hasMatch(confirmEmail);

  @action
  void sendEmail(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      CustomSuccessSnackBar(
        context,
        message: Strings.emailSendSuccess,
      ),
    );
    Modular.to.navigate('/login');
  }
}