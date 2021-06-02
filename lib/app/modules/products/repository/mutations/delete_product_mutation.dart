const String deleteProductsMutation = r'''
  mutation deleteProduct($id: ID!) {
    deleteProduct(id: $id) 
  }
''';
