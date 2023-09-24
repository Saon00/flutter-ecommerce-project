import 'package:demo/ui/state_management/bottom_navbar_controller.dart';
import 'package:demo/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/others/product_card.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WishList'),
        leading: IconButton(
          onPressed: () {
            Get.find<BottomNavBarController>().backToHome();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
          color: greyColor,
        ),
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: 0.6),
          itemCount: 10,
          itemBuilder: (context, index) {
            return const ProductCard();
          }),
    );
  }
}
