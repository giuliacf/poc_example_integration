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
          padding: EdgeInsets.all(32),
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Image.asset('assets/images/logo.png'),
                  width: 165,
                  height: 107,
                ),
                SizedBox(height: 15),
                Container(
                  width: 529,
                  child: Column(
                    children: [
                      Card(
                          color: white,
                          child: Padding(
                            padding: EdgeInsets.all(32),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: TextCustom(
                                    text: Strings.titleLoginPage,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w800,
                                    textColor: lead,
                                  ),
                                ),
                                SizedBox(height: 16),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: TextCustom(
                                    text: Strings.subTitleLoginPage,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    textColor: bluePool,
                                  ),
                                ),
                                SizedBox(height: 48),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  height: 46,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: grey),
                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                  ),
                                  child: MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                      onTap: () => print('google'),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Image.asset('assets/images/google.png', width: 24),
                                          SizedBox(width: 10),
                                          TextCustom(
                                            text: Strings.loginWithGoogle,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                            textColor: greyTwo,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 24),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: TextCustom(
                                    text: Strings.loginWithEmail,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    textColor: lead,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Observer(
                                  builder: (_) => TextFieldCustom(
                                    text: Strings.email,
                                    placeholder: Strings.emailPlaceholder,
                                    suffixIcon: Icon(
                                      IuppIcons.icone_contorno_E_email_resposta_rapida_outline,
                                      color: greyTwo,
                                    ),
                                    onChanged: this.store.setEmail,
                                  ),
                                ),
                                SizedBox(height: 21),
                                Observer(
                                  builder: (_) => TextFieldCustom(
                                    text: Strings.password,
                                    placeholder: Strings.passwordPlaceholder,
                                    obscure: !this.store.showPassword,
                                    suffixIcon: InkWell(
                                      onTap: this.store.changeShowPassword,
                                      child: Icon(
                                        this.store.showPassword ? IuppIcons.icone_contorno_O_olho_ativo_outline : IuppIcons.icone_contorno_O_olho_inativo_outline,
                                        color: greyTwo,
                                      ),
                                    ),
                                    onChanged: this.store.setPassword,
                                  ),
                                ),
                                SizedBox(height: 16),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                      child: TextCustom(
                                        text: Strings.forgotPassword,
                                        fontSize: 16,
                                        textColor: blueTwo,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      onTap: () => print('clicou'),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 48),
                                SizedBox(
                                  width: 500,
                                  height: 48,
                                  child: Observer(
                                    builder: (_) => StandardButton(
                                      text: Strings.buttonLogin,
                                      onPressed: () => Modular.to.navigate('/home'),
                                      isDisabled: !this.store.canLogin,
                                      isLoading: false,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextCustom(
                              text: Strings.labelDontHaveAccount,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              textColor: white,
                            ),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () => Modular.to.navigate('/register'),
                                child: TextCustom(
                                  text: Strings.labelRegisterNow,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  textColor: aqua,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
