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

  final _$isLoadingMoreAtom = Atom(name: '_SearchGifsStore.isLoadingMore');

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

  final _$searchTextAtom = Atom(name: '_SearchGifsStore.searchText');

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

  final _$searchGifsAsyncAction = AsyncAction('_SearchGifsStore.searchGifs');

  @override
  Future<void> searchGifs(String text) {
    return _$searchGifsAsyncAction.run(() => super.searchGifs(text));
  }

  final _$loadMoreGifsAsyncAction =
      AsyncAction('_SearchGifsStore.loadMoreGifs');

  @override
  Future<void> loadMoreGifs() {
    return _$loadMoreGifsAsyncAction.run(() => super.loadMoreGifs());
  }

  final _$_SearchGifsStoreActionController =
      ActionController(name: '_SearchGifsStore');

  @override
  dynamic setSearchText(String? value) {
    final _$actionInfo = _$_SearchGifsStoreActionController.startAction(
        name: '_SearchGifsStore.setSearchText');
    try {
      return super.setSearchText(value);
    } finally {
      _$_SearchGifsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
gifs: ${gifs},
isLoading: ${isLoading},
isLoadingMore: ${isLoadingMore},
searchText: ${searchText}
    ''';
  }
}
