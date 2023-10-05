import 'package:demo/ui/screens/product/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';

class CategoryCard extends StatelessWidget {
  final String categoryName;
  final String imgpath;
  const CategoryCard({
    super.key,
    required this.categoryName,
    required this.imgpath,
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
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Image.network(
                  imgpath,
                  height: 50,
                  width: 50,
                  fit: BoxFit.scaleDown,
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
