import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_desing/materailDesign.dart/constant.dart';

Widget CustomValidateButton(
    {required VoidCallback onPress, required String title, IconData? icon}) {
  return InkWell(
    onTap: onPress,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: borderGreenColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: GoogleFonts.cairo(color: Colors.white),
          ),
          const SizedBox(
            width: 5,
          ),
          icon != null
              ? Icon(
                  icon,
                  color: Colors.white,
                )
              : Container()
        ],
      ),
    ),
  );
}
