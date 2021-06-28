// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_password_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ForgetPasswordStore on _ForgetPasswordStore, Store {
  Computed<bool>? _$canLoginComputed;

  @override
  bool get canLogin =>
      (_$canLoginComputed ??= Computed<bool>(() => super.canLogin,
              name: '_ForgetPasswordStore.canLogin'))
          .value;
  Computed<bool>? _$isEmailValidComputed;

  @override
  bool get isEmailValid =>
      (_$isEmailValidComputed ??= Computed<bool>(() => super.isEmailValid,
              name: '_ForgetPasswordStore.isEmailValid'))
          .value;
  Computed<bool>? _$isConfirmEmailValidComputed;

  @override
  bool get isConfirmEmailValid => (_$isConfirmEmailValidComputed ??=
          Computed<bool>(() => super.isConfirmEmailValid,
              name: '_ForgetPasswordStore.isConfirmEmailValid'))
      .value;

  final _$emailAtom = Atom(name: '_ForgetPasswordStore.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$confirmEmailAtom = Atom(name: '_ForgetPasswordStore.confirmEmail');

  @override
  String get confirmEmail {
    _$confirmEmailAtom.reportRead();
    return super.confirmEmail;
  }

  @override
  set confirmEmail(String value) {
    _$confirmEmailAtom.reportWrite(value, super.confirmEmail, () {
      super.confirmEmail = value;
    });
  }

  final _$_ForgetPasswordStoreActionController =
      ActionController(name: '_ForgetPasswordStore');

  @override
  dynamic setEmail(String value) {
    final _$actionInfo = _$_ForgetPasswordStoreActionController.startAction(
        name: '_ForgetPasswordStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_ForgetPasswordStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setConfirmEmail(String value) {
    final _$actionInfo = _$_ForgetPasswordStoreActionController.startAction(
        name: '_ForgetPasswordStore.setConfirmEmail');
    try {
      return super.setConfirmEmail(value);
    } finally {
      _$_ForgetPasswordStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void sendEmail(BuildContext context) {
    final _$actionInfo = _$_ForgetPasswordStoreActionController.startAction(
        name: '_ForgetPasswordStore.sendEmail');
    try {
      return super.sendEmail(context);
    } finally {
      _$_ForgetPasswordStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
confirmEmail: ${confirmEmail},
canLogin: ${canLogin},
isEmailValid: ${isEmailValid},
isConfirmEmailValid: ${isConfirmEmailValid}
    ''';
  }
}
