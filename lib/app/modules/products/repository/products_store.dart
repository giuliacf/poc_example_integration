import 'package:flutter_modular/flutter_modular.dart';
import 'package:graphql_flutter/graphql_flutter.dart' as GraphQL;
import 'package:mobx/mobx.dart';
import 'package:poc_example_integration/app/modules/products/repository/mutations/save_products_mutation.dart';
import 'package:poc_example_integration/graphql_client.dart';
import 'package:poc_example_integration/app/modules/products/models/product_model.dart';
import 'package:gql/language.dart';
import 'package:flutter/material.dart';

part 'products_store.g.dart';

class ProductsStore = ProductsStoreBase with _$ProductsStore;

abstract class ProductsStoreBase with Store {
  GraphQLConfiguration _configuration = Modular.get<GraphQLConfiguration>();

  @observable
  bool loading = false;

  @observable
  ObservableList<Product> products = ObservableList<Product>.of([]);

  @observable
  TextEditingController nameController = TextEditingController();

  @observable
  TextEditingController descriptionController = TextEditingController();

  @observable
  TextEditingController priceController = TextEditingController();

  @action
  setLoading(bool isLoading) => loading = isLoading;

  @action
  Future<void> saveProdut() async {
    setLoading(true);

    try {
      final document = saveProductsMutation;

      final GraphQL.MutationOptions _options = GraphQL.MutationOptions(
        document: parseString(document),
        variables: <String, String>{
          'name': nameController.text,
          'description': descriptionController.text,
          'price': double.parse(priceController.text).toStringAsFixed(2),
        },
      );

      GraphQL.QueryResult response = await _configuration.graphClient().mutate(_options);
      _addProduct(response as Product);
      _clearControllers();
      // return response;
    } catch (e) {
      print(e);
    } finally {
      setLoading(false);
    }
  }

  @action
  _addProduct(Product product) {
    products.add(product);
  }

  @computed
  bool get isDisabled => nameController.text.isEmpty || descriptionController.text.isEmpty;

  _clearControllers() {
    nameController.clear();
    descriptionController.clear();
    priceController.clear();
  }
}
