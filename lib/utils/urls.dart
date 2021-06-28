import 'package:graphql_flutter/graphql_flutter.dart';

final HttpLink getGraphqlMutationUrl =
    HttpLink('http://iuppsample.dev.iupp.io/graphql');

final HttpLink getGraphqlQueryUrl =
    HttpLink('http://iuppenginesample.dev.iupp.io/graphql');

String getTenorApiUrl(String textSearch, {int position = 1}) =>
    'https://g.tenor.com/v1/search?q=$textSearch&key=ERHJ71YVS71E&limit=30&pos=$position';

String getAnimalsApiUrl({required String typeAnimal, required int page}) =>
    'https://api.the${typeAnimal}api.com/v1/images/search?size=med&mime_types=jpg&format=json&has_breeds=true&limit=10&page=$page';
