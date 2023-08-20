import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';
import '../widgets/home/common_text_field.dart';

class WelcomeBackScreen extends StatelessWidget {
  const WelcomeBackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              Image.asset(
                logoimgPath,
                width: 80,
                height: 80,
              ),
              const SizedBox(
                height: 30,
              ),
              // text
              Text(
                'Welcome Back',
                style: GoogleFonts.ubuntu(fontSize: 30),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Please enter your Email address',
                style: GoogleFonts.ubuntu(color: greyColor),
              ),
              const SizedBox(
                height: 20,
              ),

              // text field
              CommonTextField(
                hintText: 'Email Address ',
                textEditingController: TextEditingController(),
              ),
              const SizedBox(
                height: 20,
              ),
              // button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Next'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
