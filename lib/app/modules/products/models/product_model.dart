class Product {
  final String name;
  final String? description;
  final double price;
  late int points;

  Product({
    required this.name,
    required this.price,
    this.description,
  }) {
    points = (price * 48).toInt();
  }
}
