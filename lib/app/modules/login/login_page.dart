import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_example_integration/app/modules/login/login_store.dart';
import 'package:poc_example_integration/screens/widgets/button_custom.dart';
import 'package:poc_example_integration/screens/widgets/text_custom.dart';
import 'package:poc_example_integration/screens/widgets/text_field_custom.dart';
import 'package:poc_example_integration/utils/colors.dart';
import 'package:poc_example_integration/utils/strings.dart';

import '../../../iupp_icons.dart';

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
      body: Container(
          padding: EdgeInsets.all(16),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                lightGrey,
                lightGrey
                //lead,
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              width: 500,
              child: Card(
                color: white,
                elevation: 8,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16, 40, 16, 16),
                  child: Column(
                    children: [
                      TextCustom(
                        text: Strings.titleLoginPage,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        textColor: greyTwo,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Observer(
                        builder: (_) => TextFieldCustom(
                          text: Strings.email,
                          suffixIcon: Icon(
                            IuppIcons
                                .icone_contorno_E_email_resposta_rapida_outline,
                            color: greyTwo,
                          ),
                          onChanged: this.store.setEmail,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Observer(
                        builder: (_) => TextFieldCustom(
                          text: Strings.password,
                          obscure: !this.store.showPassword,
                          suffixIcon: InkWell(
                            onTap: this.store.changeShowPassword,
                            child: Icon(
                              this.store.showPassword
                                  ? IuppIcons
                                      .icone_contorno_O_olho_ativo_outline
                                  : IuppIcons
                                      .icone_contorno_O_olho_inativo_outline,
                              color: greyTwo,
                            ),
                          ),
                          onChanged: this.store.setPassword,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          child: TextCustom(
                            text: Strings.forgotPassword,
                            textDecoration: TextDecoration.underline,
                            fontSize: 11,
                            textColor: greyTwo,
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
                          child: Observer(
                            builder: (_) => ButtonCustom(
                              text: Strings.buttonLogin,
                              onPressed: () => Modular.to.navigate('/products'),
                              isDisabled: !this.store.canLogin,
                              isLoading: false,
                            ),
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextCustom(
                            text: Strings.labelDontHaveAccount,
                            fontSize: 12,
                            textColor: greyTwo,
                          ),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () => Modular.to.navigate('/register'),
                              child: TextCustom(
                                text: Strings.labelRegisterNow,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                textColor: greyTwo,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 200,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: greyTwo),
                          borderRadius: BorderRadius.all(
                            Radius.circular(14),
                          ),
                        ),
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () => print('google'),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/google.png',
                                  width: 15,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                TextCustom(
                                  text: Strings.loginWithGoogle,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  textColor: greyTwo,
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
          )),
    );
  }
}
