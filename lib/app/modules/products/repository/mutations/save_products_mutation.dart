const String saveProductsMutation = r'''
  mutation saveProduct($name: String!, $price: Float!, $description: String!) {
    saveProduct(name: $name, price: $price, description: $description) {
      name
      price,
      description
    }
  }
''';
