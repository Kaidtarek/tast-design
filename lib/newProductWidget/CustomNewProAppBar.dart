import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../materailDesign.dart/constant.dart';
import '../productWidget/navigateButton.dart';

Widget CustomNewProdAppBar({required BuildContext context}) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: paddingSize,
    ),
    child: Row(
      children: [
        const Spacer(),
        Center(
            child: Text(
          "اضافة منتجات",
          style: GoogleFonts.cairo(
              color: customPurpulColor,
              fontWeight: FontWeight.bold,
              fontSize: 17),
        )),
        const Spacer(),
        NavigateButton(
            icon: Icons.keyboard_arrow_right_outlined,
            onPress: () {
              Navigator.of(context).pop();
            }),
      ],
    ),
  );
}
