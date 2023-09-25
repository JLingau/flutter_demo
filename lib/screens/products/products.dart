import 'package:flutter/material.dart';
import 'package:flavor_bistro/models/product_model.dart';
import 'package:flavor_bistro/components/product/product_list.dart';
import 'package:flavor_bistro/components/product/product_service.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  List<ProductModel> products = ProductService().getAllProducts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Products',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/search_product");
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: ProductList(products: products),
    );
  }
}
