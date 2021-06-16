import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_example_integration/app/modules/authentication/forget_password/repository/forget_password_store.dart';
import 'package:poc_example_integration/iupp_icons.dart';
import 'package:poc_example_integration/screens/widgets/buttons/standard_button.dart';
import 'package:poc_example_integration/screens/screen_with_background.dart';
import 'package:poc_example_integration/screens/widgets/texts/text_custom.dart';
import 'package:poc_example_integration/screens/widgets/inputs/text_field_custom.dart';
import 'package:poc_example_integration/utils/colors.dart';
import 'package:poc_example_integration/utils/strings.dart';

class ForgetPasswordPage extends StatefulWidget {
  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState
    extends ModularState<ForgetPasswordPage, ForgetPasswordStore> {
  @override
  Widget build(BuildContext context) {
    return ScreenWithBackground(
      title: Strings.titleForgetPasswordPage,
      subTitle: Strings.subTitleForgetPasswordPage,
      cardContent: Column(
        children: [
          Observer(
            builder: (_) => TextFieldCustom(
              text: Strings.email,
              placeholder: Strings.email,
              suffixIcon: Icon(
                IuppIcons.icone_contorno_E_email_resposta_rapida_outline,
                color: greyTwo,
              ),
              errorText: this.store.email.isEmpty || this.store.isEmailValid
                  ? null
                  : Strings.invalidEmail,
              onChanged: this.store.setEmail,
            ),
          ),
          SizedBox(height: 24),
          Align(
            alignment: Alignment.centerLeft,
            child: TextCustom(
              text: Strings.confirmEmail,
              fontSize: 18,
              fontWeight: FontWeight.w400,
              textColor: lead,
            ),
          ),
          SizedBox(height: 20),
          Observer(
            builder: (_) => TextFieldCustom(
              text: Strings.email,
              placeholder: Strings.email,
              suffixIcon: Icon(
                IuppIcons.icone_contorno_E_email_resposta_rapida_outline,
                color: greyTwo,
              ),
              errorText: this.store.confirmEmail.isEmpty || this.store.isConfirmEmailValid
                  ? null
                  : Strings.invalidEmail,
              onChanged: this.store.setConfirmEmail,
            ),
          ),
          SizedBox(height: 48),
          SizedBox(
            width: 500,
            height: 48,
            child: Observer(
              builder: (_) => StandardButton(
                text: Strings.send,
                onPressed: () => this.store.sendEmail(context),
                isDisabled: !this.store.canLogin,
                isLoading: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
