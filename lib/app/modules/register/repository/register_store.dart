import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:poc_example_integration/app/core/data/auth_datasource.dart';
import 'package:poc_example_integration/screens/widgets/snackbar/custom_snackbar_error.dart';
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
  bool isLoading = false;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void setConfirmPassword(String value) => confirmPassword = value;

  @action
  void setLoading(bool loading) => isLoading = loading;

  @computed
  bool get isEmailValid => RegExp(emailRegex).hasMatch(email);

  @computed
  bool get isPasswordValid => password.length >= 6;

  @computed
  bool get passwordsMatch => password == confirmPassword;

  @computed
  bool get isDisabled => !(isEmailValid && isPasswordValid && passwordsMatch);

  @action
  Future<void> loginWithUserAndEmail(BuildContext context) async {
    setLoading(true);

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
          CustomErrorSnackBar(
            context,
            message: 'Já existe uma conta com este email.',
          ),
        );
      }
    } catch (e) {
      print(e);
    } finally {
      setLoading(false);
    }
  }
}
