import 'package:flutter/material.dart';
import 'package:task_desing/materailDesign.dart/constant.dart';

Border buttonBorder = Border.all(color: borderColor, width: 1);
BorderRadius buttonBorderRadius = BorderRadius.circular(10);
SliverGridDelegate customGridDelegate = const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                        );
