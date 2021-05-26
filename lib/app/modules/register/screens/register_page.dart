import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_example_integration/app/modules/register/repository/register_store.dart';
import 'package:poc_example_integration/iupp_icons.dart';
import 'package:poc_example_integration/screens/widgets/button_custom.dart';
import 'package:poc_example_integration/screens/widgets/text_custom.dart';
import 'package:poc_example_integration/screens/widgets/text_field_custom.dart';
import 'package:poc_example_integration/utils/colors.dart';
import 'package:poc_example_integration/utils/regex.dart';

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
        show
            ? IuppIcons.icone_contorno_O_olho_inativo_outline
            : IuppIcons.icone_contorno_O_olho_ativo_outline,
        color: white,
        size: 24,
      ),
      onPressed: onPressed,
    );
  }

  String? _mailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo é obrigatório';
    }
    if (!RegExp(emailRegex).hasMatch(value)) {
      return 'Email inválido';
    }
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo é obrigatório';
    }
    if (value.length < 6) {
      return 'A senha deve ter no mínimo 6 caracteres';
    }
  }

  String? _confirmPasswordValitador(String? value) {
    if (this.store.password != this.store.confirmPassword) {
      return 'As senhas devem ser iguais';
    }
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
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextCustom(
                    text: 'Registre-se',
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    textColor: white,
                  ),
                  SizedBox(height: 32),
                  TextFieldCustom(
                    text: 'Email',
                    validator: _mailValidator,
                    onChanged: this.store.setEmail,
                    suffixIcon: Icon(
                      IuppIcons.icone_contorno_E_email_resposta_rapida_outline,
                      color: white,
                      size: 24,
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFieldCustom(
                    text: 'Senha',
                    obscure: !_showPassword,
                    validator: _passwordValidator,
                    onChanged: this.store.setPassword,
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
                    text: 'Confirmação de senha',
                    obscure: !_showConfirmPassword,
                    validator: _confirmPasswordValitador,
                    onChanged: this.store.setConfirmPassword,
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
                  Observer(
                    builder: (context) => SizedBox(
                      height: 48,
                      width: 400,
                      child: ButtonCustom(
                        text: 'Salvar',
                        isDisabled: this.store.isDisabled,
                        isLoading: this.store.isLoading,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await this.store.loginWithUserAndEmail(context);
                          }
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
