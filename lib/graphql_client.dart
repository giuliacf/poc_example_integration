import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:poc_example_integration/utils/urls.dart';

class GraphQLConfiguration {
  GraphQLClient graphClientMutation() {
    return GraphQLClient(
      link: getGraphqlMutationUrl,
      cache: GraphQLCache(store: HiveStore()),
    );
  }

  GraphQLClient graphClientQuery() {
    return GraphQLClient(
      link: getGraphqlQueryUrl,
      cache: GraphQLCache(store: HiveStore()),
    );
  }
}
