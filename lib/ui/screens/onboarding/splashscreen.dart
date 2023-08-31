import 'package:demo/ui/screens/homescreens/bottom_nav_screen.dart';
import 'package:demo/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3))
        .then((value) => Get.off(const BottomNavScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  logoimgPath,
                  width: 100,
                ),
              ),
            ),
            const Column(
              children: [
                CircularProgressIndicator(
                  color: primaryColor,
                ),
                // SizedBox(
                //   height: 100,
                // ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Version 1.04',
                    style: TextStyle(
                        color: greyColor, fontSize: 12, letterSpacing: 0.6),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
