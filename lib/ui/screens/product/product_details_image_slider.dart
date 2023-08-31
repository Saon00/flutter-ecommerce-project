import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ProductDetailsImageSlider extends StatelessWidget {
  final ValueNotifier<int> _valueNotifier = ValueNotifier(0);

  ProductDetailsImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 180.0,
              viewportFraction: 1,
              autoPlay: true,
              onPageChanged: (index, _) {
                _valueNotifier.value = index;
              }),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 2.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.purple.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    'text $i',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                );
              },
            );
          }).toList(),
        ),

        // circles
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: ValueListenableBuilder(
                builder: (BuildContext context, value, Widget? child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 5; i++)
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                                color: value == i ? primaryColor : whiteColor,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        )
                    ],
                  );
                },
                valueListenable: _valueNotifier,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
