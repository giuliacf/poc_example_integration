import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_example_integration/app/modules/register/repository/register_store.dart';
import 'package:poc_example_integration/iupp_icons.dart';
import 'package:poc_example_integration/screens/widgets/buttons/standard_button.dart';
import 'package:poc_example_integration/screens/widgets/text_custom.dart';
import 'package:poc_example_integration/screens/widgets/text_field_custom.dart';
import 'package:poc_example_integration/utils/colors.dart';
import 'package:poc_example_integration/utils/strings.dart';

class RegisterPage extends StatefulWidget {
  final String title;

  const RegisterPage({Key? key, this.title = "Register"}) : super(key: key);

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
      tooltip: show ? Strings.hidePassword : Strings.showPassword,
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
              Card(
                elevation: 2,
                child: Container(
                  width: 529,
                  padding: const EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: SingleChildScrollView(
                    child: Observer(
                      builder: (context) {
                        return Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextCustom(
                                text: Strings.registerTitle,
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                textColor: lead,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextCustom(
                                text: Strings.registerSubTitle,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                textColor: bluePool,
                              ),
                              SizedBox(height: 32),
                              TextFieldCustom(
                                text: Strings.email,
                                onChanged: _store.setEmail,
                                errorText:
                                    _store.email.isEmpty || _store.isEmailValid
                                        ? null
                                        : Strings.invalidEmail,
                                suffixIcon: Icon(
                                  IuppIcons
                                      .icone_contorno_E_email_resposta_rapida_outline,
                                  color: greyTwo,
                                  size: 24,
                                ),
                              ),
                              SizedBox(height: 16),
                              TextFieldCustom(
                                text: Strings.password,
                                obscure: !_showPassword,
                                onChanged: _store.setPassword,
                                errorText: _store.password.isEmpty ||
                                        _store.isPasswordValid
                                    ? null
                                    : Strings.validatePassword,
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
                                text: Strings.confirmPassword,
                                obscure: !_showConfirmPassword,
                                onChanged: _store.setConfirmPassword,
                                errorText: _store.confirmPassword.isEmpty ||
                                        _store.passwordsMatch
                                    ? null
                                    : Strings.equalPasswords,
                                suffixIcon: getIcon(
                                  show: _showConfirmPassword,
                                  onPressed: () {
                                    setState(() {
                                      _showConfirmPassword =
                                          !_showConfirmPassword;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(height: 32),
                              SizedBox(
                                height: 48,
                                width: 400,
                                child: StandardButton(
                                  text: Strings.register,
                                  isDisabled: _store.isDisabled,
                                  isLoading: _store.isLoading,
                                  onPressed: () async {
                                    await _store
                                        .registerWithUserAndEmail(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
