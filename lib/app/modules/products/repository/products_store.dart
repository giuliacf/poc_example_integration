import 'package:flutter_modular/flutter_modular.dart';
import 'package:graphql_flutter/graphql_flutter.dart' as GraphQL;
import 'package:mobx/mobx.dart';
import 'package:poc_example_integration/app/modules/products/repository/mutations/save_products_mutation.dart';
import 'package:poc_example_integration/app/modules/products/repository/queries/list_products_query.dart';
import 'package:poc_example_integration/graphql_client.dart';
import 'package:poc_example_integration/app/modules/products/models/product_model.dart';
import 'package:gql/language.dart';

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
            price: p['price'],
            name: p['name'],
            description: p['description'],
          ));
        });

        products.addAll(prods);
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

      GraphQL.QueryResult response = await _configuration.graphClientMutation().mutate(_options);
      _addProduct(response as Product);
    } catch (e) {
      throw e;
    } finally {
      setSaveLoading(false);
    }
  }

  @action
  _addProduct(Product product) {
    products.add(product);
  }
}
