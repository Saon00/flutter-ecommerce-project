import 'package:demo/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../utils/appbar_icon_button.dart';

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
      body: const SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
