import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:poc_example_integration/utils/urls.dart';

class GraphQLConfiguration {
  GraphQLClient graphClientMutation() {
    return GraphQLClient(
      link: graphqlMutationUrl,
      cache: GraphQLCache(store: HiveStore()),
    );
  }

  GraphQLClient graphClientQuery() {
    return GraphQLClient(
      link: graphqlQueryUrl,
      cache: GraphQLCache(store: HiveStore()),
    );
  }
}
