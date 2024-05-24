import 'dart:convert';
import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_desing/materailDesign.dart/constant.dart';
import 'package:task_desing/newProductWidget/CustomNewProAppBar.dart';

import '../data/prepareData.dart';
import '../materailDesign.dart/styles.dart';
import '../newProductWidget/customNewPicture.dart';
import '../newProductWidget/customTextField.dart';

class ImagePickerScreen extends StatefulWidget {
  @override
  _ImagePickerScreenState createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _storeNameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _storeNameController.dispose();
    super.dispose();
  }

  void _submitForm(WidgetRef ref) async {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text;
      final price = double.parse(_priceController.text);
      final storeName = _storeNameController.text;
     // final category = selectedValue;

      final newProduct = Product(
        name: name,
        price: price,
        storeName: storeName,
        imagePath: _images[0].path,
        //category: category
      );
      await _saveProductLocally(newProduct);
      ref.read(productProvider.notifier).addProduct(newProduct);
    }
    Navigator.of(context).pop();
  }

  Future<void> _saveProductLocally(Product product) async {
    final prefs = await SharedPreferences.getInstance();
    final productsJson = prefs.getStringList('products') ?? [];
    productsJson.add(jsonEncode(product.toJson()));
    await prefs.setStringList('products', productsJson);
  }

  final ImagePicker _picker = ImagePicker();
  List<File> _images = [];

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _images.add(File(pickedFile.path));
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      _images.removeAt(index);
    });
  }

  final List<String> items = [
    'تصنيف 1',
    'تصنيف 2',
    'تصنيف 3',
  ];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomNewProdAppBar(context: context),
              Container(
                height: 110,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Stack(
                    children: [
                      GridView.builder(
                        gridDelegate: customGridDelegate,
                        itemBuilder: (context, index) {
                          return Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: storeBackGroundColor),
                          );
                        },
                        itemCount: 4,
                      ),
                      GridView.builder(
                        gridDelegate: customGridDelegate,
                        itemCount: _images.length,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15)),
                                child: Image.file(
                                  _images[index],
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                child: GestureDetector(
                                  onTap: () => _removeImage(index),
                                  child: CircleAvatar(
                                    backgroundColor: removeRed,
                                    radius: 15,
                                    child: Icon(
                                      Icons.close,
                                      color: storeBackGroundColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              _images.length < 4
                  ? CustomValidateButton(
                      onPress: _pickImage,
                      title: "اضغط لاضافة الصور",
                      icon: Icons.add_box_rounded)
                  : Container(),
              Form(
                key: _formKey,
                child: Expanded(
                  child: ListView(
                    children: [
                      CustomTextField(
                          passedController: _nameController,
                          title: 'اسم المنتج'),
                      CustomTextField(
                          passedController: _priceController, title: 'السعر'),
                      CustomTextField(
                          passedController: _storeNameController,
                          title: 'اسم المتجر'),
                      Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: paddingSize / 2),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              isExpanded: true,
                              hint: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    CupertinoIcons.arrowtriangle_down_circle,
                                    color: blueBodyTextColor,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'اسم التصنيف',
                                      textAlign: TextAlign.right,
                                      style: GoogleFonts.cairo(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: blueBodyTextColor,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              items: items
                                  .map(
                                      (String item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: GoogleFonts.cairo(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: blueBodyTextColor,
                                              ),
                                              textAlign: TextAlign.right,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ))
                                  .toList(),
                              value: selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value;
                                });
                              },
                              buttonStyleData: ButtonStyleData(
                                height: 50,
                                width: 160,
                                padding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  border: buttonBorder,
                                  color: bgColor,
                                ),
                                elevation: 2,
                              ),
                              iconStyleData:
                                  const IconStyleData(icon: Icon(null)),
                              dropdownStyleData: DropdownStyleData(
                                maxHeight: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: storeBackGroundColor,
                                ),
                                offset: const Offset(-20, 0),
                                scrollbarTheme: ScrollbarThemeData(
                                  radius: const Radius.circular(40),
                                  thickness: MaterialStateProperty.all(6),
                                  thumbVisibility:
                                      MaterialStateProperty.all(true),
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 40,
                                padding: EdgeInsets.only(left: 14, right: 14),
                              ),
                            ),
                          )),
                      Consumer(
                        builder: (context, ref, child) {
                          return CustomValidateButton(
                              onPress: () => _submitForm(ref),
                              title: 'اضافه المنتج');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
