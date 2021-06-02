class Product {
  final String id;
  final String name;
  final String? description;
  final double price;
  late int points;

  Product({
    required this.id,
    required this.name,
    required this.price,
    this.description,
  }) {
    points = (price * 48).toInt();
  }
}
