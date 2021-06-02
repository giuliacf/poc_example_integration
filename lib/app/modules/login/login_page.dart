import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_example_integration/app/modules/login/login_store.dart';
import 'package:poc_example_integration/screens/widgets/buttons/standard_button.dart';
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
      backgroundColor: lead,
      body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          )),
          child: Column(
            children: [
              Container(
                child: Image.asset('assets/images/logo.png'),
                width: 165,
                height: 107,
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                  width: 529,
                  child: Column(
                    children: [
                      Card(
                          color: white,
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: TextCustom(
                                    text: Strings.titleLoginPage,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                    textColor: lead,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: TextCustom(
                                    text: Strings.subTitleLoginPage,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    textColor: bluePool,
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: grey),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(14),
                                    ),
                                  ),
                                  child: MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                      onTap: () => print('google'),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            'assets/images/google.png',
                                            width: 20,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          TextCustom(
                                            text: Strings.loginWithGoogle,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            textColor: greyTwo,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: TextCustom(
                                    text: Strings.loginWithEmail,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    textColor: bluePool,
                                  ),
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
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                      child: TextCustom(
                                        text: Strings.forgotPassword,
                                        fontSize: 14,
                                        textColor: blueTwo,
                                      ),
                                      onTap: () => print('clicou'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                SizedBox(
                                  width: 500,
                                  height: 48,
                                  child: Observer(
                                    builder: (_) => StandardButton(
                                      text: Strings.buttonLogin,
                                      onPressed: () =>
                                          Modular.to.navigate('/home'),
                                      isDisabled: !this.store.canLogin,
                                      isLoading: false,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextCustom(
                              text: Strings.labelDontHaveAccount,
                              fontSize: 14,
                              textColor: white,
                            ),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () => Modular.to.navigate('/register'),
                                child: TextCustom(
                                  text: Strings.labelRegisterNow,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  textColor: aqua,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          )),
    );
  }
}
