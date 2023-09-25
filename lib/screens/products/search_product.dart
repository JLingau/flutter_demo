import 'package:flavor_bistro/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flavor_bistro/models/product_model.dart';
import 'package:flavor_bistro/components/product/product_list.dart';
import 'package:flavor_bistro/components/product/product_service.dart';

class SearchProduct extends StatefulWidget {
  const SearchProduct({Key? key}) : super(key: key);

  @override
  State<SearchProduct> createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
  List<ProductModel> products = ProductService().getAllProducts();
  List<ProductModel> searchedProducts = [];
  TextEditingController searchController = TextEditingController();

  void searchProducts(String query) {
    setState(() {
      searchedProducts = products
          .where(
            (product) =>
                product.name.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search Product',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              top: 20.0,
            ),
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: TextField(
              controller: searchController,
              onChanged: (query) => searchProducts(query),
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                hintText: 'Search products',
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              ),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: ProductList(products: searchedProducts),
          ),
        ],
      ),
    );
  }
}
