import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:poc_example_integration/app/core/data/auth_datasource.dart';
import 'package:poc_example_integration/screens/widgets/snackbar/custom_snackbar_error.dart';
import 'package:poc_example_integration/utils/regex.dart';
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

  @observable
  bool loading = false;

  @computed
  bool get isEmailValid => RegExp(emailRegex).hasMatch(email);

  @action
  void changeShowPassword() => showPassword = !showPassword;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void setLoading(bool value) => loading = value;

  @computed
  bool get canLogin => isEmailValid && password.isNotEmpty;

  @action
  Future<void> registerWithGoogle(BuildContext context) async {
    setLoading(true);
    try {
      await authDatasource.signInWithGoogle(context: context);
      Modular.to.navigate('/home');
    } catch (e) {
      print(e);
    } finally {
      setLoading(false);
    }
  }

  @action
  Future<void> login(String email, String password, BuildContext context) async {
    setLoading(true);
    try {
      await authDatasource.loginWithEmail(
        email: email,
        password: password,
      );
      Modular.to.navigate('/home');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          CustomErrorSnackBar(
            context,
            message: Strings.loginProblem,
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
