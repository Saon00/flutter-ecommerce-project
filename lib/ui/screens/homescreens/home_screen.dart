import 'package:demo/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../widgets/category_card_widget.dart';
import '../../widgets/home/appbar_icon_button.dart';
import '../../widgets/home/carousel_slider.dart';
import '../../widgets/home/remarks_widget.dart';
import '../../widgets/home/search_textfield.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            Image.asset(navLogoimgPath),
            const Spacer(),
            AppBarIcon(
              callback: () {},
              iconData: Icons.person_2_outlined,
            ),
            const SizedBox(
              width: 5,
            ),
            AppBarIcon(
              callback: () {},
              iconData: Icons.call,
            ),
            const SizedBox(
              width: 5,
            ),
            AppBarIcon(
              callback: () {},
              iconData: Icons.notifications_active_outlined,
            ),
            const SizedBox(
              width: 5,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            const SearchTextField(),
            const SizedBox(height: 10),

            // slider
            CarouselSliderWidget(),
            const SizedBox(height: 6),

            // categories
            RemarkWidget(
              remarksName: 'All Categories',
              seeAllTap: () {},
            ),

            // categories names

            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CategoryCard(
                    categoryName: 'Computer',
                  ),
                  CategoryCard(
                    categoryName: 'Computer',
                  ),
                  CategoryCard(
                    categoryName: 'Computer',
                  ),
                  CategoryCard(
                    categoryName: 'Computer',
                  ),
                  CategoryCard(
                    categoryName: 'Computer',
                  ),
                  CategoryCard(
                    categoryName: 'Computer',
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


