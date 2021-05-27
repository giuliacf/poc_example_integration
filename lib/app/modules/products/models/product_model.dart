class Product {
  final String name;
  final String? description;
  final double price;

  Product({
    required this.name,
    required this.price,
    this.description,
  });
}
