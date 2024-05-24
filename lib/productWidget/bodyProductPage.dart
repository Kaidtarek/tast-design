import 'package:flutter/material.dart';
import 'package:task_desing/productWidget/CategoriesWidget.dart';
import 'package:task_desing/productWidget/customAppBar.dart';
import 'package:task_desing/productWidget/productView.dart';
import 'package:task_desing/productWidget/reverseButton.dart';

import '../materailDesign.dart/constant.dart';

class BodyProductPage extends StatefulWidget {
  const BodyProductPage({
    super.key,
  });

  @override
  State<BodyProductPage> createState() => _BodyProductPageState();
}

class _BodyProductPageState extends State<BodyProductPage> {
  Axis? axis;
  bool? isAxisVertical;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    axis = Axis.vertical;
    isAxisVertical = true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      child: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded( child: CustomAppBar(context: context)),
               Categories(),
              Container(
                child: InkWell(
                    onTap: () {
                      setState(() {
                        isAxisVertical!
                            ? isAxisVertical = false
                            : isAxisVertical = true;
                        print(isAxisVertical);
                      });
                    },
                    child: isAxisVertical!
                        ? ReverseContainer(title: "تغيير عرض المنتجات الى افقي")
                        : ReverseContainer(
                            title: "تغيير عرض المنتجات الى عمودي")),
              ),
              Expanded(
                flex: 7,
                child: isAxisVertical!
                    ? const ProductView(
                        axis: Axis.vertical,
                      )
                    : const ProductView(axis: Axis.horizontal),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Axis ScrollAxis(Axis currentAxis) {
  if (currentAxis == Axis.vertical) {
    return Axis.horizontal;
  } else {
    return Axis.vertical;
  }
}


