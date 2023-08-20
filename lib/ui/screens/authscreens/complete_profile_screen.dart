import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors.dart';
import '../../widgets/home/common_text_field.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({super.key});

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
                'Complete Profile',
                style: GoogleFonts.ubuntu(fontSize: 30),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Get started with your details',
                style: GoogleFonts.ubuntu(color: greyColor),
              ),
              const SizedBox(
                height: 20,
              ),

              // first name
              CommonTextField(
                hintText: 'First Name',
                textEditingController: TextEditingController(),
              ),
              const SizedBox(
                height: 5,
              ),

              // last name
              CommonTextField(
                hintText: 'Last Name',
                textEditingController: TextEditingController(),
              ),
              const SizedBox(
                height: 5,
              ),

              // mobile number
              CommonTextField(
                hintText: 'Mobile',
                textEditingController: TextEditingController(),
              ),
              const SizedBox(
                height: 5,
              ),

              // city
              CommonTextField(
                hintText: 'city',
                textEditingController: TextEditingController(),
              ),
              const SizedBox(
                height: 5,
              ),

              // shipping address
              CommonTextField(
                hintText: 'Shipping Address',
                textEditingController: TextEditingController(),
                maxlines: 3,
              ),
              const SizedBox(
                height: 20,
              ),

              // button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Complete'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
