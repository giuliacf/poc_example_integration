import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_example_integration/app/modules/login/login_store.dart';
import 'package:poc_example_integration/app/modules/login/widgets/card_fields_and_buttons.dart';
import 'package:poc_example_integration/screens/widgets/button_custom.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          CardFieldsAndButtons(),
          SizedBox(height: 30,),
          ButtonCustom(
            text: 'Entrar',
            onPressed: () => null,
            isDisabled: true,
            isLoading: false,
          ),
        ],
      )
    ));
  }
}
