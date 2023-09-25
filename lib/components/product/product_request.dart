class ProductRequest {
  final String name;
  final String description;
  final String image;
  final int price;

  ProductRequest({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'image': image,
    };
  }
}
