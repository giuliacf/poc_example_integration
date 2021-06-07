import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:poc_example_integration/app/core/data/auth_datasource.dart';
import 'package:poc_example_integration/screens/widgets/snackbar/custom_snackbar_error.dart';
import 'package:poc_example_integration/utils/strings.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  final authDatasource = Modular.get<AuthDatasource>();

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  bool isLoading = false;

  @observable
  bool showPassword = false;

  @action
  void changeShowPassword() => showPassword = !showPassword;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get canLogin => email.isNotEmpty && password.isNotEmpty;

  @action
  Future<void> registerWithGoogle(BuildContext context) async {
    try {
      await authDatasource.signInWithGoogle(context: context);
      Modular.to.navigate('/home');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          CustomErrorSnackBar(
            context,
            message: Strings.accountAlreadyExists,
          ),
        );
      }
    } catch (e) {
      print(e);
    } finally {}
  }

  @action
  Future<void> login(
      String email, String password, BuildContext context) async {
    try {
      await authDatasource.loginWithEmail(
        email: email,
        password: password,
      );
      Modular.to.navigate('/home');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          CustomErrorSnackBar(
            context,
            message: Strings.accountAlreadyExists,
          ),
        );
      }
    } catch (e) {
      print(e);
    } finally {}
  }
}
