import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../materailDesign.dart/constant.dart';

Widget ReverseContainer({required String title}) {
  return Padding(
    padding: const EdgeInsets.symmetric(
        horizontal: paddingSize / 2, vertical: paddingSize / 4),
    child: FittedBox(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: storeBackGroundColor),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                title,
                style: GoogleFonts.cairo(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: redBodyTextColor),
              ),
              const SizedBox(
                width: 4,
              ),
              Image.asset('assets/product/elementequal.png')
            ],
          ),
        ),
      ),
    ),
  );
}