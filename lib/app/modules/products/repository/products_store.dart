import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gql/language.dart';
import 'package:graphql_flutter/graphql_flutter.dart' as graphql;
import 'package:iupp_components/iupp_components.dart';
import 'package:mobx/mobx.dart';

import 'package:poc_example_integration/app/modules/products/models/product_model.dart';
import 'package:poc_example_integration/app/modules/products/repository/mutations/delete_product_mutation.dart';
import 'package:poc_example_integration/app/modules/products/repository/mutations/save_products_mutation.dart';
import 'package:poc_example_integration/app/modules/products/repository/queries/list_products_query.dart';
import 'package:poc_example_integration/graphql_client.dart';

part 'products_store.g.dart';

class ProductsStore = ProductsStoreBase with _$ProductsStore;

abstract class ProductsStoreBase with Store {
  final GraphQLConfiguration _configuration =
      Modular.get<GraphQLConfiguration>();

  @observable
  bool saveLoading = false;

  @observable
  bool queryLoading = false;

  @observable
  ObservableList<Product> products = ObservableList<Product>.of([]);

  @observable
  String productName = '';

  @observable
  String productDescription = '';

  @observable
  double? productPrice;

  @observable
  bool showPoints = false;

  @observable
  String? searchText;

  @computed
  List<Product> get productsFiltered => searchText == null
      ? products.toList()
      : products
          .where(
              (p) => p.name.toLowerCase().contains(searchText!.toLowerCase()))
          .toList();

  @computed
  bool get isDisabled =>
      productName.isEmpty || productDescription.isEmpty || productPrice == null;

  @action
  dynamic setProductName(String value) => productName = value;

  @action
  dynamic setProductDescription(String value) => productDescription = value;

  @action
  dynamic setProductPrice(double? value) => productPrice = value;

  @action
  dynamic setSaveLoading({required bool value}) => saveLoading = value;

  @action
  dynamic setQueryLoading({required bool value}) => queryLoading = value;

  @action
  dynamic setShowPoints({required bool value}) => showPoints = value;

  @action
  dynamic setSearchText(String? value) => searchText = value;

  @action
  Future<void> listProducts() async {
    setQueryLoading(value: true);

    try {
      final document = graphql.gql(listProductsQuery);
      final graphql.QueryOptions _options = graphql.QueryOptions(
        document: document,
        pollInterval: Duration(minutes: 5),
        fetchPolicy: graphql.FetchPolicy.networkOnly,
      );
      final graphql.QueryResult response =
          await _configuration.graphClientQuery().query(_options);

      final json = response.data;
      if (json!['findAllProducts'] != null) {
        List<Product> prods = [];
        json['findAllProducts'].forEach((p) {
          prods.add(Product(
            id: p['id'],
            price: p['price'],
            name: p['name'],
            description: p['description'],
          ));
        });

        products = ObservableList<Product>.of(prods);
      }
    } on Exception catch (e) {
      print(e);
      rethrow;
    } finally {
      setQueryLoading(value: false);
    }
  }

  @action
  Future<void> addProduct() async {
    setSaveLoading(value: true);

    try {
      final document = parseString(saveProductsMutation);

      final graphql.MutationOptions _options = graphql.MutationOptions(
        document: document,
        variables: <String, String>{
          'name': productName,
          'description': productDescription,
          'price': productPrice!.toStringAsFixed(2),
        },
      );

      await _configuration.graphClientMutation().mutate(_options);
      listProducts();
    } on Exception catch (e) {
      print(e);
      rethrow;
    } finally {
      setSaveLoading(value: false);
    }
  }

  @action
  Future<void> deleteProduct(String id, BuildContext context) async {
    try {
      final document = parseString(deleteProductsMutation);

      final graphql.MutationOptions _options = graphql.MutationOptions(
        document: document,
        variables: <String, String>{
          'id': id,
        },
      );

      await _configuration.graphClientMutation().mutate(_options);
      listProducts();

      ScaffoldMessenger.of(context).showSnackBar(
        IuppSuccessSnackBar(
          context,
          message: AppLocalizations.of(context)!.removingProductSuccess,
        ),
      );
    } on Exception catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        IuppErrorSnackBar(
          context,
          message: AppLocalizations.of(context)!.removingProductError,
        ),
      );
    }
  }
}
