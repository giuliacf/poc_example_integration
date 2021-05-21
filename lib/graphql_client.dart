import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLConfiguration {
  static HttpLink httpLink = HttpLink('http://iuppsample.dev.iupp.io/graphql');

  GraphQLClient graphClient() {
    return GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: HiveStore()),
    );
  }
}
