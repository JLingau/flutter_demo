import 'package:flavor_bistro/models/product_model.dart';
import 'package:flavor_bistro/components/product/product_request.dart';

class ProductRepository {
  final List<ProductModel> _products = [
    ProductModel(
      id: 1,
      name: "Pizza",
      price: 72700,
      image: "assets/products/pizza.jpg",
      description:
          "Pizza is a savory dish of Italian origin consisting of a usually round, flattened base of leavened wheat-based dough topped with tomatoes, cheese, and often various other ingredients (such as anchovies, mushrooms, onions, olives, pineapple, meat, pineapple, etc.), which is then baked at a high temperature, traditionally in a wood-fired oven.",
    ),
    ProductModel(
      id: 2,
      name: "Spaghetti Carbonara",
      price: 45000,
      image: "assets/products/spaghetti.jpg",
      description:
          "Spaghetti alla carbonara is an Italian pasta dish from Rome made with egg, hard cheese, cured pork, and black pepper.",
    ),
  ];

  ProductModel addProduct(ProductRequest productRequest) {
    ProductModel product = ProductModel(
      id: _products.length + 1,
      name: productRequest.name,
      description: productRequest.description,
      price: productRequest.price,
      image: productRequest.image,
    );

    _products.add(product);
    return product;
  }

  List<ProductModel> getAllProducts() {
    return _products;
  }
}
