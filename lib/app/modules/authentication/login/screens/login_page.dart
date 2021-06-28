import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iupp_components/iupp_components.dart';

import 'package:poc_example_integration/app/modules/authentication/login/repository/login_store.dart';
import 'package:poc_example_integration/screens/screen_with_background.dart';
import 'package:poc_example_integration/screens/widgets/inputs/text_field_custom.dart';
import 'package:poc_example_integration/utils/colors.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginStore> {
  Future<void> _onSubmitForm() async {
    if (store.canLogin) {
      store.login(
        store.email,
        store.password,
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWithBackground(
      title: AppLocalizations.of(context)!.titleLoginPage,
      subTitle: AppLocalizations.of(context)!.subTitleLoginPage,
      cardContent: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () async => await store.registerWithGoogle(context),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 11,
                ),
                height: 46,
                decoration: BoxDecoration(
                  border: Border.all(color: grey),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/google.png',
                      width: 24,
                      height: 24,
                    ),
                    SizedBox(width: 10),
                    Text(
                      AppLocalizations.of(context)!.loginWithGoogle,
                      style: IuppTextStyles.bodyBody2Regular.copyWith(
                        color: grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            AppLocalizations.of(context)!.loginWithEmail,
            style: IuppTextStyles.textMediumRegular.copyWith(
              color: lead,
            ),
          ),
          SizedBox(height: 20),
          Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Observer(
                  builder: (_) => TextFieldCustom(
                    autofocus: true,
                    text: AppLocalizations.of(context)!.email,
                    placeholder: AppLocalizations.of(context)!.emailPlaceholder,
                    onFieldSubmitted: (value) => _onSubmitForm(),
                    errorText: store.email.isEmpty || store.isEmailValid
                        ? null
                        : AppLocalizations.of(context)!.invalidEmail,
                    suffixIcon: Icon(
                      IuppIcons.icone_contorno_E_email_resposta_rapida_outline,
                      color: greyTwo,
                    ),
                    onChanged: store.setEmail,
                  ),
                ),
                SizedBox(height: 21),
                Observer(
                  builder: (_) => TextFieldCustom(
                    text: AppLocalizations.of(context)!.password,
                    placeholder:
                        AppLocalizations.of(context)!.passwordPlaceholder,
                    obscure: !store.showPassword,
                    onFieldSubmitted: (value) => _onSubmitForm(),
                    suffixIcon: InkWell(
                      onTap: store.changeShowPassword,
                      child: Icon(
                        store.showPassword
                            ? IuppIcons.icone_contorno_O_olho_ativo_outline
                            : IuppIcons.icone_contorno_O_olho_inativo_outline,
                        color: greyTwo,
                      ),
                    ),
                    onChanged: store.setPassword,
                  ),
                ),
                SizedBox(height: 16),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    child: Text(
                      AppLocalizations.of(context)!.forgotPassword,
                      style: IuppTextStyles.bodyBody3XBold.copyWith(
                        color: blue,
                      ),
                    ),
                    onTap: () => Modular.to.navigate('/forget-password'),
                  ),
                ),
                SizedBox(height: 24),
                SizedBox(
                  width: 500,
                  height: 48,
                  child: Observer(
                    builder: (_) => IuppElevatedButton(
                      isLoading: store.loading,
                      text: AppLocalizations.of(context)!.buttonLogin,
                      onPressed: store.canLogin
                          ? () {
                              store.login(
                                store.email,
                                store.password,
                                context,
                              );
                            }
                          : null,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomRow: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 18,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context)!.labelDontHaveAccount,
              style: IuppTextStyles.textMediumBold.copyWith(
                color: white,
              ),
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => Modular.to.navigate('/register'),
                child: Text(
                  AppLocalizations.of(context)!.labelRegisterNow,
                  style: IuppTextStyles.textMediumBold.copyWith(
                    color: aqua,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
