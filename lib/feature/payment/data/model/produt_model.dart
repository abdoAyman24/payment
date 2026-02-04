class ProductModel {
  final int id;
  final String name;
  final double price;
  final String imagePath;
  final double discount;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.imagePath,
    this.discount = 0,
  });
}
