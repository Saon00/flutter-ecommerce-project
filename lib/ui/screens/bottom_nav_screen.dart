import 'package:demo/ui/screens/homescreens/cart_screen.dart';
import 'package:demo/ui/screens/homescreens/categories_screen.dart';
import 'package:demo/ui/screens/homescreens/home_screen.dart';
import 'package:demo/ui/screens/homescreens/wishlist_screeen.dart';
import 'package:demo/ui/state_management/bottom_navbar_controller.dart';
import 'package:demo/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final BottomNavBarController _navBarController =
      Get.put(BottomNavBarController());

  final List<Widget> _screen = [
    const HomeScreen(),
    const CategoriesScreen(),
    const CartScreen(),
    const WishListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<BottomNavBarController>(builder: (controller) {
        return _screen[controller.selectedIndex];
      }),
      bottomNavigationBar:
          GetBuilder<BottomNavBarController>(builder: (controller) {
        return BottomNavigationBar(
          selectedItemColor: primaryColor,
          unselectedItemColor: greyColor,
          showUnselectedLabels: true,
          currentIndex: controller.selectedIndex,
          onTap: (value) {
            controller.changeIndex(value);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.grid_view_outlined), label: 'Categories'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_checkout_outlined),
                label: 'Cart'),
            BottomNavigationBarItem(
                icon: Icon(Icons.card_giftcard), label: 'WishList'),
          ],
        );
      }),
    );
  }
}
