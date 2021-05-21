import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:poc_example_integration/utils/urls.dart';

class GraphQLConfiguration {


  GraphQLClient graphClient() {
    return GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: HiveStore()),
    );
  }
}
