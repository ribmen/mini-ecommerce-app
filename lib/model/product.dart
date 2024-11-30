import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;
  bool isInCart;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.imageUrl,
      this.isFavorite = false,
      this.isInCart = false});

  // Constructor that clones from an existing Product
  Product.fromProduct(Product _product)
      : id = _product.id,
        title = _product.title,
        description = _product.description,
        price = _product.price,
        imageUrl = _product.imageUrl,
        isFavorite = _product.isFavorite,
        isInCart = _product.isInCart;

  // Factory method to create a Product instance from a JSON map
  factory Product.fromJson(String id, Map<String, dynamic> json) {
    return Product(
      id: id,
      title: json['title'],
      description: json['description'],
      price: json['price']
          .toDouble(), // Assuming 'price' is stored as a double in JSON
      imageUrl: json['imageUrl'],
      isFavorite: json['isFavorite'] ??
          false, // Default to false if 'isFavorite' is not present
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'isFavorite': isFavorite,
      'isInCart': isInCart,
    };
    return data;
  }

  Map<String, Object> toMap() {
    final Map<String, Object> data = {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'isFavorite': isFavorite,
    };
    return data;
  }

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  List<Product> _cartProducts = [];

  void addToCart(Product product) {
    _cartProducts.add(product);
    notifyListeners();
  }

  int get itemCount {
    return _cartProducts.length;
  }
}
