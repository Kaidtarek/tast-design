import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_desing/productWidget/navigateButton.dart';
import 'package:task_desing/screens/addNewProduct.dart';

import '../materailDesign.dart/constant.dart';

Widget CustomAppBar({required BuildContext context}){
  return Padding(
    padding:  EdgeInsets.symmetric(horizontal: paddingSize,),
    child: Row(
                      children: [
                        NavigateButton(icon: CupertinoIcons.add, onPress: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ImagePickerScreen()));
                        }),
                        Spacer(),
                        Center(child: Text("المنتجات",style: GoogleFonts.cairo(color: customPurpulColor,fontWeight: FontWeight.bold,fontSize: 17),)),
                        Spacer()
                      ],
                    ),
  );
}