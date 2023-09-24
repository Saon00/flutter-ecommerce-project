import 'package:demo/ui/screens/product/product_details_image_slider.dart';
import 'package:demo/ui/utils/app_colors.dart';
import 'package:demo/ui/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/common_elevated_button.dart';
import '../../widgets/product_stepper.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  String testString =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.";
  final List<Color> _colors = [
    Colors.black,
    Colors.purple,
    Colors.yellow,
    Colors.green,
  ];

  final List<String> _sizes = ['S', "M", 'L', "XL", 'XXL'];

  // int _selectedColorIndex = 0;
  Color _selectedColor = Colors.black;
  String _selectedSize = 'L';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Product Details',
          style: appbarTitleStyle,
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: greyColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Column(
                children: [
                  ProductDetailsImageSlider(),
                  const SizedBox(height: 15),

                  // details part
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Adidas Sports Shoe-Specail Edition',
                                    style: titileStyle.copyWith(fontSize: 18),
                                  ),
                                  Row(
                                    children: [
                                      Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 20,
                                          ),
                                          Text(
                                            '4.5',
                                            style: ratingStyle.copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: blackColor),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Reviews',
                                          style: popularItemSubTitleStyle
                                              .copyWith(fontSize: 16),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: const Padding(
                                          padding: EdgeInsets.all(4),
                                          child: Icon(
                                            Icons.favorite_border,
                                            size: 16,
                                            color: whiteColor,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            const ProductStepper(),
                            const SizedBox(height: 10),

                            /*
                          NumberPicker(                  
                            itemHeight: 35,
                            value: _currentValue,
                            minValue: 0,
                            maxValue: 100,
                            onChanged: (value) => setState(() => _currentValue = value),
                          ),
                          */
                          ],
                        ),

                        // color lists
                        Text(
                          "Colors",
                          style: appbarTitleStyle,
                        ),
                        const SizedBox(height: 10),
                        Row(
                            children: _colors
                                .map((color) => Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: InkWell(
                                        onTap: () {
                                          if (_selectedColor != color) {
                                            _selectedColor = color;
                                            if (mounted) {
                                              setState(() {});
                                            }
                                          }
                                        },
                                        child: CircleAvatar(
                                          backgroundColor: color,
                                          radius: 15,
                                          child: Visibility(
                                              visible: color == _selectedColor,
                                              child: const Icon(Icons.check)),
                                        ),
                                      ),
                                    ))
                                .toList()),
                        const SizedBox(height: 10),

                        // Size lists
                        Text(
                          "Size",
                          style: appbarTitleStyle,
                        ),
                        const SizedBox(height: 10),
                        Row(
                            children: _sizes
                                .map((size) => Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: InkWell(
                                        onTap: () {
                                          if (_selectedSize != size) {
                                            _selectedSize = size;
                                            if (mounted) {
                                              setState(() {});
                                            }
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: size == _selectedSize
                                                  ? primaryColor
                                                  : null,
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              border:
                                                  Border.all(color: greyColor)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(size),
                                          ),
                                        ),
                                      ),
                                    ))
                                .toList()),
                        const SizedBox(height: 10),

                        // description
                        Text(
                          "Description",
                          style: appbarTitleStyle,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          testString,
                          style: subTitileStyle.copyWith(
                              fontSize: 13, color: blackColor),
                        ),
                      ],
                    ),
                  ),

                  // bottombar
                  Container(
                    decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'price',
                                style: popularItemSubTitleStyle.copyWith(
                                  color: blackColor,
                                ),
                              ),
                              Text(
                                '\$100',
                                style: popularItemSubTitleStyle.copyWith(
                                    fontSize: 20),
                              )
                            ],
                          ),

                          // button
                          SizedBox(
                            width: 120,
                            child: CommonElevatedButton(
                                title: 'Add to Card', onTap: () {}),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
