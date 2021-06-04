class Product {
  final String id;
  final String name;
  final String? description;
  final double price;
  late int points;
  late int gainPoints;

  Product({
    required this.id,
    required this.name,
    required this.price,
    this.description,
  }) {
    points = (price * 55).toInt();
    gainPoints = (price * 3).toInt();
  }
}
