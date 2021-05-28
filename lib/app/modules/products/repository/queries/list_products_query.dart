const String listProductsQuery = r'''
  query findAllProducts {
    findAllProducts {
      id
      name
      price
      description
    }
  }
''';
