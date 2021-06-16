// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_bar_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppBarStore on _AppBarStore, Store {
  final _$pageSelectedAtom = Atom(name: '_AppBarStore.pageSelected');

  @override
  String get pageSelected {
    _$pageSelectedAtom.reportRead();
    return super.pageSelected;
  }

  @override
  set pageSelected(String value) {
    _$pageSelectedAtom.reportWrite(value, super.pageSelected, () {
      super.pageSelected = value;
    });
  }

  final _$searchedWordAtom = Atom(name: '_AppBarStore.searchedWord');

  @override
  String get searchedWord {
    _$searchedWordAtom.reportRead();
    return super.searchedWord;
  }

  @override
  set searchedWord(String value) {
    _$searchedWordAtom.reportWrite(value, super.searchedWord, () {
      super.searchedWord = value;
    });
  }

  final _$currentIndexAtom = Atom(name: '_AppBarStore.currentIndex');

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

  final _$_AppBarStoreActionController = ActionController(name: '_AppBarStore');

  @override
  void changeWord(String value) {
    final _$actionInfo = _$_AppBarStoreActionController.startAction(
        name: '_AppBarStore.changeWord');
    try {
      return super.changeWord(value);
    } finally {
      _$_AppBarStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSelectedIndex(int index) {
    final _$actionInfo = _$_AppBarStoreActionController.startAction(
        name: '_AppBarStore.changeSelectedIndex');
    try {
      return super.changeSelectedIndex(index);
    } finally {
      _$_AppBarStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void search(String word) {
    final _$actionInfo =
        _$_AppBarStoreActionController.startAction(name: '_AppBarStore.search');
    try {
      return super.search(word);
    } finally {
      _$_AppBarStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearSearch() {
    final _$actionInfo = _$_AppBarStoreActionController.startAction(
        name: '_AppBarStore.clearSearch');
    try {
      return super.clearSearch();
    } finally {
      _$_AppBarStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pageSelected: ${pageSelected},
searchedWord: ${searchedWord},
currentIndex: ${currentIndex}
    ''';
  }
}
