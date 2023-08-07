import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({
    super.key,
    required ValueNotifier<int> valueNotifier,
  }) : _valueNotifier = valueNotifier;

  final ValueNotifier<int> _valueNotifier;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 150.0,
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
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.amber,
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
        const SizedBox(height: 10),

        // circles
        ValueListenableBuilder(
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
                          color: value == i ? primaryColor : null,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )
              ],
            );
          },
          valueListenable: _valueNotifier,
        ),
      ],
    );
  }
}
