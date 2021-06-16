// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_gifs_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchGifsStore on _SearchGifsStore, Store {
  final _$gifsAtom = Atom(name: '_SearchGifsStore.gifs');

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

  final _$wordSearchedAtom = Atom(name: '_SearchGifsStore.wordSearched');

  @override
  String get wordSearched {
    _$wordSearchedAtom.reportRead();
    return super.wordSearched;
  }

  @override
  set wordSearched(String value) {
    _$wordSearchedAtom.reportWrite(value, super.wordSearched, () {
      super.wordSearched = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_SearchGifsStore.isLoading');

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

  final _$searchGifsAsyncAction = AsyncAction('_SearchGifsStore.searchGifs');

  @override
  Future<dynamic> searchGifs(String word) {
    return _$searchGifsAsyncAction.run(() => super.searchGifs(word));
  }

  @override
  String toString() {
    return '''
gifs: ${gifs},
wordSearched: ${wordSearched},
isLoading: ${isLoading}
    ''';
  }
}
