// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterStore on RegisterStoreBase, Store {
  Computed<bool>? _$isDisabledComputed;

  @override
  bool get isDisabled =>
      (_$isDisabledComputed ??= Computed<bool>(() => super.isDisabled,
              name: 'RegisterStoreBase.isDisabled'))
          .value;

  final _$emailControllerAtom = Atom(name: 'RegisterStoreBase.emailController');

  @override
  TextEditingController get emailController {
    _$emailControllerAtom.reportRead();
    return super.emailController;
  }

  @override
  set emailController(TextEditingController value) {
    _$emailControllerAtom.reportWrite(value, super.emailController, () {
      super.emailController = value;
    });
  }

  final _$passwordControllerAtom =
      Atom(name: 'RegisterStoreBase.passwordController');

  @override
  TextEditingController get passwordController {
    _$passwordControllerAtom.reportRead();
    return super.passwordController;
  }

  @override
  set passwordController(TextEditingController value) {
    _$passwordControllerAtom.reportWrite(value, super.passwordController, () {
      super.passwordController = value;
    });
  }

  final _$confirmPasswordControllerAtom =
      Atom(name: 'RegisterStoreBase.confirmPasswordController');

  @override
  TextEditingController get confirmPasswordController {
    _$confirmPasswordControllerAtom.reportRead();
    return super.confirmPasswordController;
  }

  @override
  set confirmPasswordController(TextEditingController value) {
    _$confirmPasswordControllerAtom
        .reportWrite(value, super.confirmPasswordController, () {
      super.confirmPasswordController = value;
    });
  }

  final _$isLoadingAtom = Atom(name: 'RegisterStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$loginWithUserAndEmailAsyncAction =
      AsyncAction('RegisterStoreBase.loginWithUserAndEmail');

  @override
  Future<void> loginWithUserAndEmail(BuildContext context) {
    return _$loginWithUserAndEmailAsyncAction
        .run(() => super.loginWithUserAndEmail(context));
  }

  final _$RegisterStoreBaseActionController =
      ActionController(name: 'RegisterStoreBase');

  @override
  void setLoading(bool loading) {
    final _$actionInfo = _$RegisterStoreBaseActionController.startAction(
        name: 'RegisterStoreBase.setLoading');
    try {
      return super.setLoading(loading);
    } finally {
      _$RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
emailController: ${emailController},
passwordController: ${passwordController},
confirmPasswordController: ${confirmPasswordController},
isLoading: ${isLoading},
isDisabled: ${isDisabled}
    ''';
  }
}
