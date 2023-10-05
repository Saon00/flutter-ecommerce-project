import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo/data/models/home_slider_model.dart';
import 'package:demo/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CarouselSliderWidget extends StatelessWidget {
  // const CarouselSliderWidget({
  //   super.key,
  //   required ValueNotifier<int> valueNotifier,
  // }) : _valueNotifier = valueNotifier;

  // final ValueNotifier<int> _valueNotifier;

  // final CarouselController _carouselController = CarouselController();
  // reactive notifier
  final ValueNotifier<int> _valueNotifier = ValueNotifier(0);
  final HomeSliderModel homeSliderModel;

  CarouselSliderWidget({super.key, required this.homeSliderModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 150.0,
              viewportFraction: 1,
              autoPlayAnimationDuration: const Duration(seconds: 3),
              autoPlay: true,
              onPageChanged: (index, _) {
                _valueNotifier.value = index;
              }),
          items: homeSliderModel.sliderData!.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 2.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      image:
                          DecorationImage(image: NetworkImage(i.image ?? '')),
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  // child: Text(
                  //   'text $i',
                  //   style: const TextStyle(fontSize: 16.0),
                  // ),
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
                for (int i = 0;
                    i < (homeSliderModel.sliderData?.length ?? 0);
                    i++)
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: 12,
                      width: 12,
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
