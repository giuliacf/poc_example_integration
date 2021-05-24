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

  Widget getIcon({
    required bool show,
    void Function()? onPressed,
  }) {
    return IconButton(
      tooltip: show ? 'Ocultar senha' : 'Exibir senha',
      icon: Icon(
        show ? Icons.visibility_off_outlined : Icons.visibility_outlined,
        color: lightGrey,
      ),
      onPressed: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Observer(
          builder: (context) {
            return Container(
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFieldCustom(
                        text: 'Email',
                        controller: this.store.emailController,
                        suffixIcon: Icon(
                          Icons.email,
                          color: lightGrey,
                        ),
                      ),
                      SizedBox(height: 8),
                      TextFieldCustom(
                        text: 'Senha',
                        controller: this.store.passwordController,
                        obscure: !_showPassword,
                        suffixIcon: getIcon(
                          show: _showPassword,
                          onPressed: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 8),
                      TextFieldCustom(
                        text: 'Confirmar senha',
                        controller: this.store.confirmPasswordController,
                        obscure: !_showConfirmPassword,
                        suffixIcon: getIcon(
                          show: _showConfirmPassword,
                          onPressed: () {
                            setState(() {
                              _showConfirmPassword = !_showConfirmPassword;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 24),
                      SizedBox(
                        height: 48,
                        width: 400,
                        child: ButtonCustom(
                          text: 'Salvar',
                          isDisabled: false,
                          isLoading: false,
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              // TODO: save in firebase
                              await this.store.loginWithUserAndEmail(context);
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
