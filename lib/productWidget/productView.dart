import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_desing/productWidget/initialProduct.dart';
import 'package:task_desing/productWidget/produntsWidget.dart';

import '../data/prepareData.dart';
import '../materailDesign.dart/constant.dart';

class ProductView extends StatelessWidget {
  final Axis axis;
  const ProductView({super.key,  this.axis = Axis.vertical});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final products = ref.watch(productProvider);
      return ListView.builder(
        scrollDirection: axis,
        itemCount: products.length + 4,
        itemBuilder: (context, index) {
          if (index < 4) {
            // Display initial products
            return Container(
              alignment: Alignment.topCenter,
              width: 400,
              child: InitialProduct(
                product: initialProduct[index],
              ),
            );
          } else {
            // Display products from the local mobile
            return Container(
              width: 400,
              alignment: Alignment.topCenter,
              child: ProductItem(
                product: products[index - 4],
              ),
            );
          }
        },
      );
    });
  }
}
