import 'package:demo/ui/state_management/bottom_navbar_controller.dart';
import 'package:demo/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/others/category_card_widget.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        leading: IconButton(
          onPressed: () {
            // getx binding
            Get.find<BottomNavBarController>().backToHome();
            // final BottomNavBarController navBarController =
            //     Get.put(BottomNavBarController());
            // navBarController.backToHome();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: blackColor.withOpacity(.5),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            itemCount: 30,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            itemBuilder: (context, index) {
              return const CategoryCard(categoryName: 'Dummy');
            }),
      ),
    );
  }
}
