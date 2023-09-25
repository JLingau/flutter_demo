import 'package:flavor_bistro/models/product_cart.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<ProductCart> _items = [];

  List<ProductCart> get items => _items;

  void addItem(ProductCart item) {
    final itemIndex = _items.indexWhere((element) => element.id == item.id);
    if (itemIndex >= 0) {
      _items[itemIndex].quantity++;
    } else {
      _items.add(item);
    }
    notifyListeners();
  }

  void removeQuantity(ProductCart item) {
    final itemIndex = _items.indexWhere((element) => element.id == item.id);
    if (_items[itemIndex].quantity > 1) {
      _items[itemIndex].quantity--;
    } else {
      _items.removeAt(itemIndex);
    }
    notifyListeners();
  }

  void removeItem(int itemIndex) {
    _items.removeAt(itemIndex);
    notifyListeners();
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }
}
