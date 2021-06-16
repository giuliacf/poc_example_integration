import 'package:graphql_flutter/graphql_flutter.dart';

class Urls {
  static HttpLink graphqlMutationUrl =
  HttpLink('http://iuppsample.dev.iupp.io/graphql');
  static HttpLink graphqlQueryUrl =
  HttpLink('http://iuppenginesample.dev.iupp.io/graphql');
  static String tenorApiUrl(String wordSearched) =>
      'https://g.tenor.com/v1/search?q=$wordSearched&key=ERHJ71YVS71E&limit=30';

  static String animalsApiUrl(String typeAnimal) =>
      'https://api.the${typeAnimal}api.com/v1/images/search?size=med&mime_types=jpg&format=json&has_breeds=true&order=RANDOM&limit=10';
}
