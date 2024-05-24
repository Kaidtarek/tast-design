import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/prepareData.dart';
import '../materailDesign.dart/constant.dart';
import 'produntsWidget.dart';

class InitialProduct extends StatelessWidget {
  final Product product;

  const InitialProduct({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                   crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    product.name,
                    style: GoogleFonts.cairo(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 5),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Currency(title: "دولار"),
                        Price(price: product.price)
                      ],
                    ),
                  const SizedBox(height: 5),
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        color: storeBackGroundColor,
                        borderRadius: BorderRadius.circular(5)),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      product.storeName,
                      style: GoogleFonts.cairo(fontSize: 9, color: storeTitleColor),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Image.asset(
              product.imagePath!,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}