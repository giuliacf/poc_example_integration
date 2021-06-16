// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStore, Store {
  Computed<bool>? _$showCleanSearchComputed;

  @override
  bool get showCleanSearch =>
      (_$showCleanSearchComputed ??= Computed<bool>(() => super.showCleanSearch,
              name: '_HomeStore.showCleanSearch'))
          .value;

  final _$searchTextControllerAtom =
      Atom(name: '_HomeStore.searchTextController');

  @override
  TextEditingController get searchTextController {
    _$searchTextControllerAtom.reportRead();
    return super.searchTextController;
  }

  @override
  set searchTextController(TextEditingController value) {
    _$searchTextControllerAtom.reportWrite(value, super.searchTextController,
        () {
      super.searchTextController = value;
    });
  }

  final _$searchTextAtom = Atom(name: '_HomeStore.searchText');

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

  final _$currentIndexAtom = Atom(name: '_HomeStore.currentIndex');

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  final _$_HomeStoreActionController = ActionController(name: '_HomeStore');

  @override
  void changeSearch(String? value) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.changeSearch');
    try {
      return super.changeSearch(value);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSelectedIndex(int index) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.changeSelectedIndex');
    try {
      return super.changeSelectedIndex(index);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void search() {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.search');
    try {
      return super.search();
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearSearch() {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.clearSearch');
    try {
      return super.clearSearch();
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchTextController: ${searchTextController},
searchText: ${searchText},
currentIndex: ${currentIndex},
showCleanSearch: ${showCleanSearch}
    ''';
  }
}
