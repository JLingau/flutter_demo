class ProductCart {
  final int id;
  final String name;
  final String description;
  final String image;
  final int price;
  int quantity;

  ProductCart({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.quantity,
  });
}
