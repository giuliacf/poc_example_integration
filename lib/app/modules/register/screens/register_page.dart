import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_example_integration/app/modules/register/repository/register_store.dart';
import 'package:poc_example_integration/iupp_icons.dart';
import 'package:poc_example_integration/screens/widgets/button_custom.dart';
import 'package:poc_example_integration/screens/widgets/text_custom.dart';
import 'package:poc_example_integration/screens/widgets/text_field_custom.dart';
import 'package:poc_example_integration/utils/colors.dart';
import 'package:poc_example_integration/utils/strings.dart';

class RegisterPage extends StatefulWidget {
  final String title;

  const RegisterPage({Key? key, this.title = "Register"}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _store = Modular.get<RegisterStore>();

  bool _showPassword = false;
  bool _showConfirmPassword = false;

  Widget getIcon({
    required bool show,
    void Function()? onPressed,
  }) {
    return IconButton(
      tooltip: show ? Strings.hidePassword : Strings.showPassword,
      icon: Icon(
        show ? IuppIcons.icone_contorno_O_olho_inativo_outline : IuppIcons.icone_contorno_O_olho_ativo_outline,
        color: white,
        size: 24,
      ),
      onPressed: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(child: Observer(
            builder: (context) {
              return Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextCustom(
                      text: Strings.register,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      textColor: white,
                    ),
                    SizedBox(height: 32),
                    TextFieldCustom(
                      text: Strings.email,
                      onChanged: _store.setEmail,
                      errorText: _store.email.isEmpty || _store.isEmailValid ? null : Strings.invalidEmail,
                      suffixIcon: Icon(
                        IuppIcons.icone_contorno_E_email_resposta_rapida_outline,
                        color: white,
                        size: 24,
                      ),
                    ),
                    SizedBox(height: 16),
                    TextFieldCustom(
                      text: Strings.password,
                      obscure: !_showPassword,
                      onChanged: _store.setPassword,
                      errorText: _store.password.isEmpty || _store.isPasswordValid ? null : Strings.validatePassword,
                      suffixIcon: getIcon(
                        show: _showPassword,
                        onPressed: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 16),
                    TextFieldCustom(
                      text: Strings.confirmPassword,
                      obscure: !_showConfirmPassword,
                      onChanged: _store.setConfirmPassword,
                      errorText: _store.confirmPassword.isEmpty || _store.passwordsMatch ? null : Strings.equalPasswords,
                      suffixIcon: getIcon(
                        show: _showConfirmPassword,
                        onPressed: () {
                          setState(() {
                            _showConfirmPassword = !_showConfirmPassword;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 32),
                    SizedBox(
                      height: 48,
                      width: 400,
                      child: ButtonCustom(
                        text: Strings.saveButton,
                        isDisabled: _store.isDisabled,
                        isLoading: _store.isLoading,
                        onPressed: () async {
                          await _store.loginWithUserAndEmail(context);
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          )),
        ),
      ),
    );
  }
}
