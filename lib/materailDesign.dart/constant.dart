import 'package:flutter/material.dart';
import 'package:task_desing/data/prepareData.dart';

final Color bgColor = Color(0xFFD9D9D9);
final Color borderColor = Colors.black.withOpacity(0.2);
final Color buttonColor = Color(0xFFFFFFFF);
final Color customPurpulColor = Color(0xFF3E3E68);
final Color borderGreenColor = Color(0xFF3EB86F);
final Color storeTitleColor = Color(0xFFA1A1A1);
final Color storeBackGroundColor = Color(0xFFEEEEEE);
final Color blueBodyTextColor = Color(0xFF5973DE);
final Color removeRed = Colors.red.withOpacity(0.5);
final Color redBodyTextColor = Color(0xFFFF4155);
const double paddingSize = 30.0;
// initial product to get just from local file ,*this images from assets
List<Product> initialProduct = [
  Product(
      name: 'هذا النص هو مثال لنص',
      //  category: 'تصنيف 1',
      price: 120,
      storeName: 'اسم المتجر',
      imagePath: 'assets/product/product1.png'),
  Product(
      name: 'هذا النص هو مثال لنص',
      //   category: 'تصنيف 1',
      price: 120,
      storeName: 'اسم المتجر',
      imagePath: 'assets/product/product2.png'),
  Product(
      name: 'هذا النص هو مثال لنص',
      price: 120,
      //  category: 'تصنيف 1',
      storeName: 'اسم المتجر',
      imagePath: 'assets/product/product3.png'),
  Product(
      name: 'هذا النص هو مثال لنص',
      price: 120,
      //  category: 'تصنيف 1',
      storeName: 'اسم المتجر',
      imagePath: 'assets/product/product4.png'),
];
