import 'package:flutter/material.dart';
import 'product.dart';

class Cart with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  void addProduto(Product product) {
    _products.add(product);
    notifyListeners();
  }

  void removerProduto(Product product) {
    _products.remove(product);
    notifyListeners();
  }

  bool temProduto(Product product) {
    return _products.contains(product);
  }

  double get total {
    if (_products.isEmpty) return 0.0;
    return _products.map((product) => product.price).reduce((a, b) => a + b);
  }
}
