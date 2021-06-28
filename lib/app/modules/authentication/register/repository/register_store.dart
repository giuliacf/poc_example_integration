import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iupp_components/iupp_components.dart';
import 'package:mobx/mobx.dart';

import 'package:poc_example_integration/app/core/data/auth_datasource.dart';
import 'package:poc_example_integration/utils/regex.dart';

part 'register_store.g.dart';

class RegisterStore = RegisterStoreBase with _$RegisterStore;

abstract class RegisterStoreBase with Store {
  final authDatasource = Modular.get<AuthDatasource>();

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String confirmPassword = '';

  @observable
  bool agreeWithTerms = false;

  @observable
  bool isLoading = false;

  @action
  dynamic setEmail(String value) => email = value;

  @action
  dynamic setPassword(String value) => password = value;

  @action
  dynamic setConfirmPassword(String value) => confirmPassword = value;

  @action
  dynamic setAgreeWithTerms({required bool agree}) => agreeWithTerms = agree;

  @action
  dynamic setLoading({required bool loading}) => isLoading = loading;

  @computed
  bool get isEmailValid => RegExp(emailRegex).hasMatch(email);

  @computed
  bool get isPasswordValid => password.length >= 6;

  @computed
  bool get passwordsMatch => password == confirmPassword;

  @computed
  bool get isDisabled =>
      !(isEmailValid && isPasswordValid && passwordsMatch && agreeWithTerms);

  @action
  Future<void> registerWithUserAndEmail(BuildContext context) async {
    setLoading(loading: true);

    try {
      await authDatasource.registerWithEmail(
        email: email,
        password: password,
        context: context,
      );

      Modular.to.navigate('/home');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          IuppErrorSnackBar(
            context,
            message: AppLocalizations.of(context)!.accountAlreadyExists,
          ),
        );
      }
    } on Exception catch (e) {
      print(e);
    } finally {
      setLoading(loading: false);
    }
  }
}
