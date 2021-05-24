import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_example_integration/app/modules/register/repository/register_store.dart';
import 'package:poc_example_integration/screens/widgets/button_custom.dart';
import 'package:poc_example_integration/screens/widgets/text_field_custom.dart';
import 'package:poc_example_integration/utils/colors.dart';

class RegisterPage extends StatefulWidget {
  final String title;
  const RegisterPage({Key? key, this.title = "Register"}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends ModularState<RegisterPage, RegisterStore> {
  final _formKey = GlobalKey<FormState>();

  bool _showPassword = false;
  bool _showConfirmPassword = false;

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo é obrigatório';
    }
  }

  String? _emailValidator(String? value) {
    _validator(value);
    if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!)) {
      return 'email inválido';
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    _validator(value);
    if (this.store.passwordController != this.store.confirmPasswordController) {
      return 'As senhas devem ser iguais';
    }
    return null;
  }

  Widget getIcon(bool show) {
    return IconButton(
      tooltip: show ? 'Ocultar senha' : 'Exibir senha',
      icon: Icon(
        show ? Icons.visibility_off_outlined : Icons.visibility_outlined,
        color: lightGrey,
      ),
      onPressed: () {
        setState(() {
          show = !show;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lead,
      body: Center(
        child: Observer(
          builder: (context) {
            return Container(
              width: 400,
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFieldCustom(
                        text: 'email',
                        controller: this.store.emailController,
                        validator: _emailValidator,
                        suffixIcon: Icon(
                          Icons.email,
                          color: lightGrey,
                        ),
                      ),
                      SizedBox(height: 8),
                      TextFieldCustom(
                        text: 'senha',
                        controller: this.store.passwordController,
                        obscure: !_showPassword,
                        validator: _validator,
                        suffixIcon: getIcon(_showPassword),
                      ),
                      SizedBox(height: 8),
                      TextFieldCustom(
                        text: 'confirmar senha',
                        controller: this.store.confirmPasswordController,
                        obscure: !_showConfirmPassword,
                        validator: _passwordValidator,
                        suffixIcon: getIcon(_showConfirmPassword),
                      ),
                      SizedBox(height: 24),
                      SizedBox(
                        height: 48,
                        width: 400,
                        child: ButtonCustom(
                          text: 'salvar',
                          isDisabled: false,
                          isLoading: false,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // TODO: save in firebase
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
