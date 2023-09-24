import 'package:demo/ui/screens/onboarding/splashscreen.dart';
import 'package:demo/ui/state_management/bottom_navbar_controller.dart';
import 'package:demo/ui/state_management/user_auth_controller.dart';
import 'package:demo/ui/utils/app_colors.dart';
import 'package:demo/ui/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: GetXBindings(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            elevation: .5,
            titleTextStyle: appbarTitleStyle),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            textStyle: GoogleFonts.ubuntu(),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

// binders
class GetXBindings extends Bindings {
  @override
  void dependencies() {
    // Get.create<BottomNavBarController>(() => BottomNavBarController());
    Get.put(BottomNavBarController());
    Get.put(UserAuthController());
  }
}
