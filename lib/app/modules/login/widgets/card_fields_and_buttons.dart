import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_example_integration/screens/widgets/button_custom.dart';
import 'package:poc_example_integration/screens/widgets/text_custom.dart';
import 'package:poc_example_integration/screens/widgets/text_field_custom.dart';
import 'package:poc_example_integration/utils/colors.dart';

import '../../../../iupp_icons.dart';

class CardFieldsAndButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        width: 500,
        child: Card(
          color: lead,
          elevation: 8,
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 40, 16, 16),
            child: Column(
              children: [
                TextCustom(
                  text: 'Faça seu login!',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  textColor: white,
                ),
                SizedBox(
                  height: 25,
                ),
                TextFieldCustom(
                  text: 'Email',
                  suffixIcon: Icon(
                    IuppIcons.icone_contorno_E_email_resposta_rapida_outline,
                    color: white,
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
                    color: white,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    child: TextCustom(
                      text: 'Esqueceu a senha?',
                      textDecoration: TextDecoration.underline,
                      fontSize: 11,
                      textColor: white,
                    ),
                    onTap: () => print('clicou'),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 500,
                  height: 48,
                  child: ButtonCustom(
                    text: 'Entrar',
                    onPressed: () => null,
                    isDisabled: false,
                    isLoading: false,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextCustom(
                      text: 'Ainda não possui conta? ',
                      fontSize: 12,
                      textColor: white,
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => Modular.to.navigate('/register'),
                        child: TextCustom(
                          text: ' Cadastre-se agora!',
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          textColor: white,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                TextCustom(
                  text: 'OU',
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  textColor: white,
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 200,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: white),
                    borderRadius: BorderRadius.all(
                      Radius.circular(14),
                    ),
                  ),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => Modular.to.navigate('/register'),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/google.png",
                            width: 15,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          TextCustom(
                            text: ' Login com Google',
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            textColor: white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
