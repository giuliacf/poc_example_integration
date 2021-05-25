import 'package:flutter/material.dart';
import 'package:poc_example_integration/screens/widgets/button_custom.dart';
import 'package:poc_example_integration/screens/widgets/text_custom.dart';
import 'package:poc_example_integration/screens/widgets/text_field_custom.dart';

import '../../../../iupp_icons.dart';

class CardFieldsAndButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TextFieldCustom(
                text: 'Email',
                suffixIcon: Icon(
                  IuppIcons.icone_contorno_E_email_resposta_rapida_outline,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFieldCustom(
                text: 'Senha',
                obscure: true,
                suffixIcon: Icon(
                  IuppIcons.icone_contorno_O_olho_inativo_outline,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                child: TextCustom(
                  text: 'Esqueceu a senha?',
                  textDecoration: TextDecoration.underline,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ButtonCustom(
                text: 'Entrar',
                onPressed: () => null,
                isDisabled: false,
                isLoading: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
