// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductsStore on ProductsStoreBase, Store {
  Computed<bool>? _$isDisabledComputed;

  @override
  bool get isDisabled =>
      (_$isDisabledComputed ??= Computed<bool>(() => super.isDisabled,
              name: 'ProductsStoreBase.isDisabled'))
          .value;

  final _$loadingAtom = Atom(name: 'ProductsStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$productsAtom = Atom(name: 'ProductsStoreBase.products');

  @override
  ObservableList<Product> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(ObservableList<Product> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  final _$productNameAtom = Atom(name: 'ProductsStoreBase.productName');

  @override
  String get productName {
    _$productNameAtom.reportRead();
    return super.productName;
  }

  @override
  set productName(String value) {
    _$productNameAtom.reportWrite(value, super.productName, () {
      super.productName = value;
    });
  }

  final _$productDescriptionAtom =
      Atom(name: 'ProductsStoreBase.productDescription');

  @override
  String get productDescription {
    _$productDescriptionAtom.reportRead();
    return super.productDescription;
  }

  @override
  set productDescription(String value) {
    _$productDescriptionAtom.reportWrite(value, super.productDescription, () {
      super.productDescription = value;
    });
  }

  final _$productPriceAtom = Atom(name: 'ProductsStoreBase.productPrice');

  @override
  double get productPrice {
    _$productPriceAtom.reportRead();
    return super.productPrice;
  }

  @override
  set productPrice(double value) {
    _$productPriceAtom.reportWrite(value, super.productPrice, () {
      super.productPrice = value;
    });
  }

  final _$saveProdutAsyncAction = AsyncAction('ProductsStoreBase.saveProdut');

  @override
  Future<void> saveProdut() {
    return _$saveProdutAsyncAction.run(() => super.saveProdut());
  }

  final _$ProductsStoreBaseActionController =
      ActionController(name: 'ProductsStoreBase');

  @override
  dynamic setProductName(String value) {
    final _$actionInfo = _$ProductsStoreBaseActionController.startAction(
        name: 'ProductsStoreBase.setProductName');
    try {
      return super.setProductName(value);
    } finally {
      _$ProductsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setProductDescription(String value) {
    final _$actionInfo = _$ProductsStoreBaseActionController.startAction(
        name: 'ProductsStoreBase.setProductDescription');
    try {
      return super.setProductDescription(value);
    } finally {
      _$ProductsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setProductPrice(double value) {
    final _$actionInfo = _$ProductsStoreBaseActionController.startAction(
        name: 'ProductsStoreBase.setProductPrice');
    try {
      return super.setProductPrice(value);
    } finally {
      _$ProductsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoading(bool isLoading) {
    final _$actionInfo = _$ProductsStoreBaseActionController.startAction(
        name: 'ProductsStoreBase.setLoading');
    try {
      return super.setLoading(isLoading);
    } finally {
      _$ProductsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _addProduct(Product product) {
    final _$actionInfo = _$ProductsStoreBaseActionController.startAction(
        name: 'ProductsStoreBase._addProduct');
    try {
      return super._addProduct(product);
    } finally {
      _$ProductsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
products: ${products},
productName: ${productName},
productDescription: ${productDescription},
productPrice: ${productPrice},
isDisabled: ${isDisabled}
    ''';
  }
}
