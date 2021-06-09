import 'dart:math';

class Product {
  final String id;
  final String name;
  final String? description;
  final double price;
  late int points;
  late int gainPoints;
  late String image;

  Product({
    required this.id,
    required this.name,
    required this.price,
    this.description,
  }) {
    points = (price * 55).toInt();
    gainPoints = (price * 3).toInt();
    image = 'assets/images/products/${Random().nextInt(8) + 1}.png';
  }
}
