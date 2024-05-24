import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';

class Product {
  final String name;
  final double price;
  final String storeName;
  final String? imagePath; 
//  final String? category;

  Product({
    required this.name,
    required this.price,
    required this.storeName,
    this.imagePath,
   // this.category
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      price: json['price'],
      storeName: json['storeName'],
      imagePath: json['imagePath'], 
    //  category: json['category']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'storeName': storeName,
      'imagePath': imagePath, 
   //   'category':category,
    };
  }
}

class ProductNotifier extends StateNotifier<List<Product>> {
  ProductNotifier({List<Product> initialProducts = const []})
      : super(initialProducts) {
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    final prefs = await SharedPreferences.getInstance();
    final productsJson = prefs.getStringList('products');
    if (productsJson != null) {
      state = productsJson
          .map((json) => Product.fromJson(jsonDecode(json)))
          .toList();
    }
  }

  Future<void> _saveProducts() async {
    final prefs = await SharedPreferences.getInstance();
    final productsJson =
        state.map((product) => jsonEncode(product.toJson())).toList();
    await prefs.setStringList('products', productsJson);
  }

  void addProduct(Product product) {
    state = [...state, product];
    _saveProducts();
  }
}

final productProvider =
    StateNotifierProvider<ProductNotifier, List<Product>>((ref) {
  return ProductNotifier();
});
