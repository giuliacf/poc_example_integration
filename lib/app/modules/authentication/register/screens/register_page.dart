import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iupp_components/components/atoms/atoms.dart';
import 'package:iupp_components/iupp_components.dart';

import 'package:poc_example_integration/app/modules/authentication/register/repository/register_store.dart';
import 'package:poc_example_integration/screens/screen_with_background.dart';
import 'package:poc_example_integration/screens/widgets/inputs/text_field_custom.dart';
import 'package:poc_example_integration/utils/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _store = Modular.get<RegisterStore>();

  bool _showPassword = false;
  bool _showConfirmPassword = false;

  Widget getIcon({
    required bool show,
    void Function()? onPressed,
  }) {
    return IconButton(
      tooltip: show
          ? AppLocalizations.of(context)!.hidePassword
          : AppLocalizations.of(context)!.showPassword,
      icon: Icon(
        show
            ? IuppIcons.icone_contorno_O_olho_inativo_outline
            : IuppIcons.icone_contorno_O_olho_ativo_outline,
        color: greyTwo,
        size: 24,
      ),
      onPressed: onPressed,
    );
  }

  Future<void> _onSubmitForm() async {
    if (!_store.isDisabled) {
      await _store.registerWithUserAndEmail(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWithBackground(
      cardContent: Observer(
        builder: (context) {
          return Form(
            key: _formKey,
            child: Column(
              children: [
                TextFieldCustom(
                  text: AppLocalizations.of(context)!.email,
                  placeholder: AppLocalizations.of(context)!.emailPlaceholder,
                  onChanged: _store.setEmail,
                  onFieldSubmitted: (value) => _onSubmitForm(),
                  errorText: _store.email.isEmpty || _store.isEmailValid
                      ? null
                      : AppLocalizations.of(context)!.invalidEmail,
                  suffixIcon: Icon(
                    IuppIcons.icone_contorno_E_email_resposta_rapida_outline,
                    color: greyTwo,
                    size: 24,
                  ),
                ),
                SizedBox(height: 16),
                TextFieldCustom(
                  text: AppLocalizations.of(context)!.password,
                  obscure: !_showPassword,
                  onChanged: _store.setPassword,
                  onFieldSubmitted: (value) => _onSubmitForm(),
                  errorText: _store.password.isEmpty || _store.isPasswordValid
                      ? null
                      : AppLocalizations.of(context)!.validatePassword,
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
                  text: AppLocalizations.of(context)!.confirmPassword,
                  placeholder: AppLocalizations.of(context)!.confirmPassword,
                  obscure: !_showConfirmPassword,
                  onChanged: _store.setConfirmPassword,
                  onFieldSubmitted: (value) => _onSubmitForm(),
                  errorText:
                      _store.confirmPassword.isEmpty || _store.passwordsMatch
                          ? null
                          : AppLocalizations.of(context)!.equalPasswords,
                  suffixIcon: getIcon(
                    show: _showConfirmPassword,
                    onPressed: () {
                      setState(() {
                        _showConfirmPassword = !_showConfirmPassword;
                      });
                    },
                  ),
                ),
                SizedBox(height: 16),
                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  activeColor: aqua,
                  value: _store.agreeWithTerms,
                  title: Text.rich(
                    TextSpan(
                      text: AppLocalizations.of(context)!.agreeWithTerms,
                      style: IuppTextStyles.bodyBody3Regular,
                      children: [
                        TextSpan(
                          text:
                              AppLocalizations.of(context)!.termsAndConditions,
                          style: IuppTextStyles.bodyBody3Regular.copyWith(
                            color: blue,
                          ),
                        ),
                        TextSpan(
                          text: ' ${AppLocalizations.of(context)!.and} ',
                          style: IuppTextStyles.bodyBody3Regular,
                        ),
                        TextSpan(
                          text: AppLocalizations.of(context)!.privacyPolicy,
                          style: IuppTextStyles.bodyBody3Regular.copyWith(
                            color: blue,
                          ),
                        )
                      ],
                    ),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (bool? value) {
                    _store.setAgreeWithTerms(value ?? false);
                  },
                ),
                SizedBox(height: 32),
                SizedBox(
                  width: 500,
                  height: 48,
                  child: IuppElevatedButton(
                    isLoading: _store.isLoading,
                    text: AppLocalizations.of(context)!.register,
                    onPressed: !_store.isDisabled
                        ? () async {
                            await _store.registerWithUserAndEmail(context);
                          }
                        : null,
                  ),
                ),
              ],
            ),
          );
        },
      ),
      title: AppLocalizations.of(context)!.register,
      subTitle: AppLocalizations.of(context)!.registerSubTitle,
    );
  }
}
