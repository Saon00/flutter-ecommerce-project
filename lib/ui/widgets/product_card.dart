import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/text_style.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Card(
        shadowColor: primaryColor.withOpacity(.3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 3,
        child: Column(
          children: [
            Image.asset(
              'assets/images/shoe.png',
              width: 150,
              height: 90,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'Nike Sports U1810E',
                    style: popularItemTitleStyle,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$200',
                        style: popularItemSubTitleStyle,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 14,
                          ),
                          Text(
                            '4.5',
                            style: ratingStyle,
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(5)),
                        child: const Padding(
                          padding: EdgeInsets.all(4),
                          child: Icon(
                            Icons.favorite_border,
                            size: 14,
                            color: whiteColor,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
