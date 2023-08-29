import 'package:demo/ui/screens/homescreens/home_screen.dart';
import 'package:demo/ui/utils/app_colors.dart';
import 'package:demo/ui/widgets/category_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            setState(() {
              Get.offAll(const HomeScreen());
            });
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
