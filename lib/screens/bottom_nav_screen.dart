import 'package:demo/screens/cart_screen.dart';
import 'package:demo/screens/categories_screen.dart';
import 'package:demo/screens/homescreens/home_screen.dart';
import 'package:demo/screens/wishlist_screeen.dart';
import 'package:demo/utils/app_colors.dart';
import 'package:flutter/material.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final List<Widget> _screen = [
    const HomeScreen(),
    const CategoriesScreen(),
    const CartScreen(),
    const WishListScreen(),
  ];

  int _selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: primaryColor,
        unselectedItemColor: greyColor,
        showUnselectedLabels: true,
        currentIndex: _selectIndex,
        onTap: (value) {
          _selectIndex = value;
          if (mounted) {
            setState(() {});
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_view_outlined), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_checkout_outlined), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard), label: 'WishList'),
        ],
      ),
    );
  }
}
