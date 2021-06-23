import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iupp_components/iupp_components.dart';

import 'package:poc_example_integration/app/modules/authentication/forget_password/repository/forget_password_store.dart';
import 'package:poc_example_integration/screens/screen_with_background.dart';
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Observer(
            builder: (_) => TextFieldCustom(
              text: Strings.email,
              placeholder: Strings.emailPlaceholder,
              suffixIcon: Icon(
                IuppIcons.icone_contorno_E_email_resposta_rapida_outline,
                color: greyTwo,
              ),
              errorText: store.email.isEmpty || store.isEmailValid
                  ? null
                  : Strings.invalidEmail,
              onChanged: store.setEmail,
            ),
          ),
          SizedBox(height: 16),
          Text(
            Strings.confirmEmail,
            style: IuppTextStyles.textMediumRegular.copyWith(
              color: lead,
            ),
          ),
          SizedBox(height: 16),
          Observer(
            builder: (_) => TextFieldCustom(
              text: Strings.email,
              placeholder: Strings.emailPlaceholder,
              suffixIcon: Icon(
                IuppIcons.icone_contorno_E_email_resposta_rapida_outline,
                color: greyTwo,
              ),
              errorText: store.confirmEmail.isEmpty || store.isConfirmEmailValid
                  ? null
                  : Strings.invalidEmail,
              onChanged: store.setConfirmEmail,
            ),
          ),
          SizedBox(height: 32),
          SizedBox(
            width: 500,
            height: 48,
            child: Observer(
              builder: (_) => IuppElevatedButton(
                text: Strings.send,
                onPressed:
                    store.canLogin ? () => store.sendEmail(context) : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
