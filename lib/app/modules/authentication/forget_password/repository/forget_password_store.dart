import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iupp_components/iupp_components.dart';
import 'package:mobx/mobx.dart';

import 'package:poc_example_integration/utils/regex.dart';

part 'forget_password_store.g.dart';

class ForgetPasswordStore = _ForgetPasswordStore with _$ForgetPasswordStore;

abstract class _ForgetPasswordStore with Store {
  @observable
  String email = '';

  @observable
  String confirmEmail = '';

  @action
  dynamic setEmail(String value) => email = value;

  @action
  dynamic setConfirmEmail(String value) => confirmEmail = value;

  @computed
  bool get canLogin => email.isNotEmpty && confirmEmail.isNotEmpty;

  @computed
  bool get isEmailValid => RegExp(emailRegex).hasMatch(email);

  @computed
  bool get isConfirmEmailValid => RegExp(emailRegex).hasMatch(confirmEmail);

  @action
  void sendEmail(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      IuppSuccessSnackBar(
        context,
        message: AppLocalizations.of(context)!.emailSendSuccess,
      ),
    );
    Modular.to.navigate('/login');
  }
}
