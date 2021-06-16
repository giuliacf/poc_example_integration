import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_example_integration/app/modules/authentication/login/repository/login_store.dart';
import 'package:poc_example_integration/iupp_icons.dart';
import 'package:poc_example_integration/screens/widgets/buttons/standard_button.dart';
import 'package:poc_example_integration/screens/screen_with_background.dart';
import 'package:poc_example_integration/screens/widgets/texts/text_custom.dart';
import 'package:poc_example_integration/screens/widgets/inputs/text_field_custom.dart';
import 'package:poc_example_integration/utils/colors.dart';
import 'package:poc_example_integration/utils/strings.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginStore> {
  @override
  Widget build(BuildContext context) {
    return ScreenWithBackground(
      title: Strings.titleLoginPage,
      subTitle: Strings.subTitleLoginPage,
      cardContent: Column(
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
                onTap: () async => await this.store.registerWithGoogle(context),
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 46,
                  decoration: BoxDecoration(
                    border: Border.all(color: grey),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
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
                )),
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
              errorText: this.store.email.isEmpty || this.store.isEmailValid
                  ? null
                  : Strings.invalidEmail,
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
                  this.store.showPassword
                      ? IuppIcons.icone_contorno_O_olho_ativo_outline
                      : IuppIcons.icone_contorno_O_olho_inativo_outline,
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
                onTap: () => Modular.to.navigate('/forget-password'),
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
                onPressed: () => this.store.login(
                      this.store.email,
                      this.store.password,
                      context,
                    ),
                isDisabled: !this.store.canLogin,
                isLoading: this.store.loading,
              ),
            ),
          ),
        ],
      ),
      bottomRow: Padding(
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
    );
  }
}
