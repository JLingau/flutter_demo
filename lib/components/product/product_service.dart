import 'package:flavor_bistro/models/product_model.dart';
import 'package:flavor_bistro/components/product/product_request.dart';
import 'package:flavor_bistro/components/product/product_repository.dart';

class ProductService {
  final ProductRepository productRepository = ProductRepository();

  ProductModel addProduct(ProductRequest product) {
    return productRepository.addProduct(product);
  }

  List<ProductModel> getAllProducts() {
    return productRepository.getAllProducts();
  }
}
