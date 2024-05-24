import 'package:flutter/material.dart';
import '../productWidget/bodyProductPage.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyProductPage(),
    );
  }
}


