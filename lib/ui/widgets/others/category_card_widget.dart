import 'package:demo/ui/screens/product/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';

class CategoryCard extends StatelessWidget {
  final String categoryName;
  const CategoryCard({
    super.key,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => const ProductListScreen());
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: primaryColor.withOpacity(.10),
                  borderRadius: BorderRadius.circular(5)),
              child: const Padding(
                padding: EdgeInsets.all(15),
                child: Icon(
                  Icons.computer_rounded,
                  color: primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              categoryName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: primaryColor,
                letterSpacing: 0.6,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
