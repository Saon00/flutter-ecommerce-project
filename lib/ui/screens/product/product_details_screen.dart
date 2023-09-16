import 'package:demo/ui/screens/product/product_details_image_slider.dart';
import 'package:demo/ui/utils/app_colors.dart';
import 'package:demo/ui/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  var _currentValue = 0;
  late TextEditingController _stepperController;

  @override
  void initState() {
    super.initState();
    _stepperController = TextEditingController(text: '1');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ProductDetailsImageSlider(),
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
                            crossAxisAlignment: WrapCrossAlignment.center,
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
                              style: popularItemSubTitleStyle.copyWith(
                                  fontSize: 16),
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(5)),
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
                Wrap(
                  children: [
                    // minus
                    ElevatedButton(
                      onPressed: () {
                        if (_currentValue > 1) {
                          _currentValue--;
                          _stepperController.text = _currentValue.toString();
                        }
                      },
                      child: const Icon(
                        Icons.remove,
                      ),
                    ),

                    // numbers
                    SizedBox(
                      width: 50,
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: _stepperController,
                        style: appbarTitleStyle,
                        enabled: false,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                    ),

                    // add
                    ElevatedButton(
                      onPressed: () {
                        if (_currentValue < 20) {
                          _currentValue++;
                          _stepperController.text = _currentValue.toString();
                        }
                      },
                      child: const Icon(Icons.add),
                    ),
                  ],
                )
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
          ],
        ),
      ),
    );
  }
}
