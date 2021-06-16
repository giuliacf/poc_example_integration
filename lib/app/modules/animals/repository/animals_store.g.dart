// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animals_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AnimalsStore on _AnimalsStore, Store {
  final _$animalsAtom = Atom(name: '_AnimalsStore.animals');

  @override
  ObservableList<Animal> get animals {
    _$animalsAtom.reportRead();
    return super.animals;
  }

  @override
  set animals(ObservableList<Animal> value) {
    _$animalsAtom.reportWrite(value, super.animals, () {
      super.animals = value;
    });
  }

  final _$isDogApiAtom = Atom(name: '_AnimalsStore.isDogApi');

  @override
  bool get isDogApi {
    _$isDogApiAtom.reportRead();
    return super.isDogApi;
  }

  @override
  set isDogApi(bool value) {
    _$isDogApiAtom.reportWrite(value, super.isDogApi, () {
      super.isDogApi = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_AnimalsStore.isLoading');

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

  final _$getApiDataAsyncAction = AsyncAction('_AnimalsStore.getApiData');

  @override
  Future<void> getApiData() {
    return _$getApiDataAsyncAction.run(() => super.getApiData());
  }

  final _$_AnimalsStoreActionController =
      ActionController(name: '_AnimalsStore');

  @override
  dynamic changeApi(bool val) {
    final _$actionInfo = _$_AnimalsStoreActionController.startAction(
        name: '_AnimalsStore.changeApi');
    try {
      return super.changeApi(val);
    } finally {
      _$_AnimalsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void searchAnimal(String word) {
    final _$actionInfo = _$_AnimalsStoreActionController.startAction(
        name: '_AnimalsStore.searchAnimal');
    try {
      return super.searchAnimal(word);
    } finally {
      _$_AnimalsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
animals: ${animals},
isDogApi: ${isDogApi},
isLoading: ${isLoading}
    ''';
  }
}
