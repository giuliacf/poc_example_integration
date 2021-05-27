import 'package:flutter_modular/flutter_modular.dart';
import 'package:graphql_flutter/graphql_flutter.dart' as GraphQL;
import 'package:mobx/mobx.dart';
import 'package:poc_example_integration/app/modules/products/repository/mutations/save_products_mutation.dart';
import 'package:poc_example_integration/graphql_client.dart';
import 'package:poc_example_integration/app/modules/products/models/product_model.dart';
import 'package:gql/language.dart';

part 'products_store.g.dart';

class ProductsStore = ProductsStoreBase with _$ProductsStore;

abstract class ProductsStoreBase with Store {
  GraphQLConfiguration _configuration = Modular.get<GraphQLConfiguration>();

  @observable
  bool loading = false;

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
  setLoading(bool isLoading) => loading = isLoading;

  @action
  Future<void> saveProdut() async {
    setLoading(true);

    try {
      // final document = saveProductsMutation;

      // final GraphQL.MutationOptions _options = GraphQL.MutationOptions(
      //   document: parseString(document),
      //   variables: <String, String>{
      //     'name': productName,
      //     'description': productDescription,
      //     'price': productPrice!.toStringAsFixed(2),
      //   },
      // );

      // GraphQL.QueryResult response = await _configuration.graphClient().mutate(_options);
      // _addProduct(response as Product);

      _addProduct(Product(
        name: productName,
        description: productDescription,
        price: productPrice!,
      ));
    } catch (e) {
      throw e;
    } finally {
      setLoading(false);
    }
  }

  @action
  _addProduct(Product product) {
    products.add(product);
  }
}
