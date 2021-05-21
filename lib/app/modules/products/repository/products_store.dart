import 'package:flutter_modular/flutter_modular.dart';
import 'package:graphql_flutter/graphql_flutter.dart' as Graphql;
import 'package:mobx/mobx.dart';
import 'package:poc_example_integration/app/modules/products/repository/mutations/save_products_mutation.dart';
import 'package:poc_example_integration/graphql_client.dart';
import 'package:poc_example_integration/app/modules/products/models/product_model.dart';
import 'package:gql/language.dart';
import 'package:flutter/material.dart';

part 'products_store.g.dart';

class ProductsStore = ProductsStoreBase with _$ProductsStore;

abstract class ProductsStoreBase with Store {
  GraphQLConfiguration configuration = Modular.get<GraphQLConfiguration>();

  @observable
  Product product;

  @observable
  bool loading = false;

  @observable
  TextEditingController nameController = TextEditingController();

  @observable
  TextEditingController descriptionController = TextEditingController();

  @observable
  TextEditingController priceController = TextEditingController();

  @action
  setLoading(bool isLoading) => loading = isLoading;

  @action
  Future<Graphql.QueryResult> saveProdut() async {
    setLoading(true);

    try {
      final document = saveProductsMutation;

      final Graphql.MutationOptions _options = Graphql.MutationOptions(
        document: parseString(document),
        variables: <String, String>{
          'name': nameController.text,
          'description': descriptionController.text,
          'price': double.parse(priceController.text).toStringAsFixed(2),
        },
      );

      final response = await configuration.graphClient().mutate(_options);
      _clearControllers();
      return response;
    } catch (e) {
      print(e);
    } finally {
      setLoading(false);
    }

    return null;
  }

  @computed
  bool get isDisabled => nameController.text.isEmpty || descriptionController.text.isEmpty || priceController.text.isEmpty;

  _clearControllers() {
    nameController.clear();
    descriptionController.clear();
    priceController.clear();
  }
}
