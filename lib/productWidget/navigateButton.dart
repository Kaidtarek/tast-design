import 'package:flutter/material.dart';

import '../materailDesign.dart/constant.dart';
import '../materailDesign.dart/styles.dart';

Widget NavigateButton({required IconData icon,required VoidCallback onPress}){
  
  return IconButton(
    onPressed: onPress,
    icon: Container(
                          height: 50,
                          width: 50,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: buttonColor,
                            borderRadius: buttonBorderRadius,
                            border: buttonBorder,
                          ),
                          child: Icon(icon,size: 33,),
                        ),
  );
}