// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductsStore on ProductsStoreBase, Store {
  final _$productAtom = Atom(name: 'ProductsStoreBase.product');

  @override
  Product get product {
    _$productAtom.reportRead();
    return super.product;
  }

  @override
  set product(Product value) {
    _$productAtom.reportWrite(value, super.product, () {
      super.product = value;
    });
  }

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

  final _$nameControllerAtom = Atom(name: 'ProductsStoreBase.nameController');

  @override
  TextEditingController get nameController {
    _$nameControllerAtom.reportRead();
    return super.nameController;
  }

  @override
  set nameController(TextEditingController value) {
    _$nameControllerAtom.reportWrite(value, super.nameController, () {
      super.nameController = value;
    });
  }

  final _$descriptionControllerAtom =
      Atom(name: 'ProductsStoreBase.descriptionController');

  @override
  TextEditingController get descriptionController {
    _$descriptionControllerAtom.reportRead();
    return super.descriptionController;
  }

  @override
  set descriptionController(TextEditingController value) {
    _$descriptionControllerAtom.reportWrite(value, super.descriptionController,
        () {
      super.descriptionController = value;
    });
  }

  final _$priceControllerAtom = Atom(name: 'ProductsStoreBase.priceController');

  @override
  TextEditingController get priceController {
    _$priceControllerAtom.reportRead();
    return super.priceController;
  }

  @override
  set priceController(TextEditingController value) {
    _$priceControllerAtom.reportWrite(value, super.priceController, () {
      super.priceController = value;
    });
  }

  final _$saveProdutAsyncAction = AsyncAction('ProductsStoreBase.saveProdut');

  @override
  Future<Graphql.QueryResult> saveProdut() {
    return _$saveProdutAsyncAction.run(() => super.saveProdut());
  }

  final _$ProductsStoreBaseActionController =
      ActionController(name: 'ProductsStoreBase');

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
  String toString() {
    return '''
product: ${product},
loading: ${loading},
nameController: ${nameController},
descriptionController: ${descriptionController},
priceController: ${priceController}
    ''';
  }
}
