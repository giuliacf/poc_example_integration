// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_gifs_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchGifsStore on SearchGifsStoreBase, Store {
  final _$gifsAtom = Atom(name: 'SearchGifsStoreBase.gifs');

  @override
  ObservableList<String> get gifs {
    _$gifsAtom.reportRead();
    return super.gifs;
  }

  @override
  set gifs(ObservableList<String> value) {
    _$gifsAtom.reportWrite(value, super.gifs, () {
      super.gifs = value;
    });
  }

  final _$searchedWordAtom = Atom(name: 'SearchGifsStoreBase.searchedWord');

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

  final _$isLoadingAtom = Atom(name: 'SearchGifsStoreBase.isLoading');

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

  final _$searchGifsAsyncAction = AsyncAction('SearchGifsStoreBase.searchGifs');

  @override
  Future<void> searchGifs() {
    return _$searchGifsAsyncAction.run(() => super.searchGifs());
  }

  @override
  String toString() {
    return '''
gifs: ${gifs},
searchedWord: ${searchedWord},
isLoading: ${isLoading}
    ''';
  }
}
