import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:graphql_flutter/graphql_flutter.dart' as GraphQL;
import 'package:mobx/mobx.dart';
import 'package:poc_example_integration/app/modules/products/repository/mutations/delete_product_mutation.dart';
import 'package:poc_example_integration/app/modules/products/repository/mutations/save_products_mutation.dart';
import 'package:poc_example_integration/app/modules/products/repository/queries/list_products_query.dart';
import 'package:poc_example_integration/graphql_client.dart';
import 'package:poc_example_integration/app/modules/products/models/product_model.dart';
import 'package:gql/language.dart';
import 'package:poc_example_integration/screens/widgets/snackbar/custom_snackbar_error.dart';
import 'package:poc_example_integration/screens/widgets/snackbar/custom_snackbar_success.dart';
import 'package:poc_example_integration/utils/strings.dart';

part 'products_store.g.dart';

class ProductsStore = ProductsStoreBase with _$ProductsStore;

abstract class ProductsStoreBase with Store {
  GraphQLConfiguration _configuration = Modular.get<GraphQLConfiguration>();

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

  @computed
  bool get isDisabled => productName.isEmpty || productDescription.isEmpty || productPrice == null;

  @action
  setProductName(String value) => productName = value;

  @action
  setProductDescription(String value) => productDescription = value;

  @action
  setProductPrice(double? value) => productPrice = value;

  @action
  setSaveLoading(bool loading) => saveLoading = loading;

  @action
  setQueryLoading(bool loading) => queryLoading = loading;

  @action
  setShowPoints(bool value) => showPoints = value;

  @action
  Future<void> listProducts() async {
    setQueryLoading(true);

    try {
      final document = GraphQL.gql(listProductsQuery);
      final GraphQL.QueryOptions _options = GraphQL.QueryOptions(
        document: document,
        pollInterval: Duration(minutes: 5),
        fetchPolicy: GraphQL.FetchPolicy.networkOnly,
      );
      final GraphQL.QueryResult response = await _configuration.graphClientQuery().query(_options);

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
    } catch (e) {
      throw e;
    } finally {
      setQueryLoading(false);
    }
  }

  @action
  Future<void> saveProduct() async {
    setSaveLoading(true);

    try {
      final document = parseString(saveProductsMutation);

      final GraphQL.MutationOptions _options = GraphQL.MutationOptions(
        document: document,
        variables: <String, String>{
          'name': productName,
          'description': productDescription,
          'price': productPrice!.toStringAsFixed(2),
        },
      );

      await _configuration.graphClientMutation().mutate(_options);
      listProducts();
    } catch (e) {
      throw e;
    } finally {
      setSaveLoading(false);
    }
  }

  @action
  Future<void> deleteProduct(String id, BuildContext context) async {
    try {
      final document = parseString(deleteProductsMutation);

      final GraphQL.MutationOptions _options = GraphQL.MutationOptions(
        document: document,
        variables: <String, String>{
          'id': id,
        },
      );

      await _configuration.graphClientMutation().mutate(_options);
      _removeProduct(id);

      ScaffoldMessenger.of(context).showSnackBar(
        CustomSuccessSnackBar(
          context,
          message: Strings.removingProductSuccess,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        CustomErrorSnackBar(
          context,
          message: Strings.removingProductError,
        ),
      );
    }
  }

  _removeProduct(String id) {
    int index = products.indexWhere((prod) => prod.id == id);
    products.removeAt(index);
  }
}
