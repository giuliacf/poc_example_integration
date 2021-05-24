import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:poc_example_integration/app/core/data/auth_datasource.dart';
import 'package:poc_example_integration/screens/widgets/snackbar/custom_snackbar_error.dart';

part 'register_store.g.dart';

class RegisterStore = RegisterStoreBase with _$RegisterStore;

abstract class RegisterStoreBase with Store {
  final authDatasource = Modular.get<AuthDatasource>();

  @observable
  TextEditingController emailController = TextEditingController();

  @observable
  TextEditingController passwordController = TextEditingController();

  @observable
  TextEditingController confirmPasswordController = TextEditingController();

  @action
  Future<void> loginWithUserAndEmail(BuildContext context) async {
    try {
      await authDatasource.registerWithEmail(
        email: emailController.text,
        password: passwordController.text,
        context: context,
      );

      Modular.to.pushReplacementNamed('/home');
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
    }
  }
}
