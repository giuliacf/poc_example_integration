// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animals_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AnimalsStore on _AnimalsStore, Store {
  Computed<List<Animal>>? _$animalsFilteredComputed;

  @override
  List<Animal> get animalsFiltered => (_$animalsFilteredComputed ??=
          Computed<List<Animal>>(() => super.animalsFiltered,
              name: '_AnimalsStore.animalsFiltered'))
      .value;

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

  final _$isLoadingMoreAtom = Atom(name: '_AnimalsStore.isLoadingMore');

  @override
  bool get isLoadingMore {
    _$isLoadingMoreAtom.reportRead();
    return super.isLoadingMore;
  }

  @override
  set isLoadingMore(bool value) {
    _$isLoadingMoreAtom.reportWrite(value, super.isLoadingMore, () {
      super.isLoadingMore = value;
    });
  }

  final _$searchTextAtom = Atom(name: '_AnimalsStore.searchText');

  @override
  String? get searchText {
    _$searchTextAtom.reportRead();
    return super.searchText;
  }

  @override
  set searchText(String? value) {
    _$searchTextAtom.reportWrite(value, super.searchText, () {
      super.searchText = value;
    });
  }

  final _$apiPageAtom = Atom(name: '_AnimalsStore.apiPage');

  @override
  int get apiPage {
    _$apiPageAtom.reportRead();
    return super.apiPage;
  }

  @override
  set apiPage(int value) {
    _$apiPageAtom.reportWrite(value, super.apiPage, () {
      super.apiPage = value;
    });
  }

  final _$getApiDataAsyncAction = AsyncAction('_AnimalsStore.getApiData');

  @override
  Future<void> getApiData() {
    return _$getApiDataAsyncAction.run(() => super.getApiData());
  }

  final _$loadMoreAnimalsAsyncAction =
      AsyncAction('_AnimalsStore.loadMoreAnimals');

  @override
  Future<void> loadMoreAnimals() {
    return _$loadMoreAnimalsAsyncAction.run(() => super.loadMoreAnimals());
  }

  final _$_AnimalsStoreActionController =
      ActionController(name: '_AnimalsStore');

  @override
  dynamic setSearchText(String? value) {
    final _$actionInfo = _$_AnimalsStoreActionController.startAction(
        name: '_AnimalsStore.setSearchText');
    try {
      return super.setSearchText(value);
    } finally {
      _$_AnimalsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeApi(bool val) {
    final _$actionInfo = _$_AnimalsStoreActionController.startAction(
        name: '_AnimalsStore.changeApi');
    try {
      return super.changeApi(val);
    } finally {
      _$_AnimalsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
animals: ${animals},
isDogApi: ${isDogApi},
isLoading: ${isLoading},
isLoadingMore: ${isLoadingMore},
searchText: ${searchText},
apiPage: ${apiPage},
animalsFiltered: ${animalsFiltered}
    ''';
  }
}
