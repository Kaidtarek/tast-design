import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../materailDesign.dart/constant.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double pageHeight = MediaQuery.of(context).size.height;
    double pageWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: paddingSize / 2,),
      child: Container(
        alignment: Alignment.topRight,
        child: Column(
          children: [
            Text(
              "التصنيفات",
              style: GoogleFonts.cairo(
                  color: customPurpulColor.withOpacity(0.8),
                  fontWeight: FontWeight.w500,
                  fontSize: 11),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CategoriesItems(
                  image: 'assets/categories/ctg_3.png',
                  title: "تصنيف 3",
                  isSelectedItem: false,
                ),
                CategoriesItems(
                  image: 'assets/categories/ctg_2.png',
                  title: "تصنيف 2",
                  isSelectedItem: false,
                ),
                CategoriesItems(
                  image: 'assets/categories/ctg_1.png',
                  title: "تصنيف 1",
                  isSelectedItem: false,
                ),
                CategoriesItems(
                  title: 'عرض الكل',
                  isSelectedItem: true,
                  stackImage: const [
                    'assets/categories/ctg_green.png',
                    'assets/categories/centerIcon.png'
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CategoriesItems extends StatelessWidget {
  final String? image;
  final String title;
  bool isSelectedItem;
  List<String>?
      stackImage; // this for first item cause it have custom icon inside image
  CategoriesItems(
      {super.key,
      this.image,
      required this.title,
      required this.isSelectedItem,
      this.stackImage});

  @override
  Widget build(BuildContext context) {
    double pageHeight = MediaQuery.of(context).size.height;
    double pageWidth = MediaQuery.of(context).size.width;
    return Container(
      width: pageWidth / 4.5,
      height: pageHeight/7,
      decoration: BoxDecoration(
          color: bgColor,
          border: isSelectedItem ? Border.all(color: borderGreenColor) : null,
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            stackImage == null
                ? Image.asset(
                    image!,
                    fit: BoxFit.cover,
                  )
                : Stack(
                  alignment: Alignment.center,
                    children: [
                      Image.asset(
                        stackImage![0],
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        stackImage![1],
                        alignment: Alignment.center,
                        fit: BoxFit.cover,
                      )
                    ],
                  ),
            Text(
              title,
              style:
                  GoogleFonts.cairo(fontWeight: FontWeight.w700, fontSize: 9),
            )
          ],
        ),
      ),
    );
  }
}
