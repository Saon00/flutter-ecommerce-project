import 'package:demo/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPscreen extends StatelessWidget {
  const OTPscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // logo
            Image.asset(
              'assets/images/logo.png',
              width: 80,
              height: 80,
            ),
            const SizedBox(
              height: 30,
            ),

            // text
            Text(
              'Enter OTP Code',
              style: GoogleFonts.ubuntu(fontSize: 30),
            ),
            Text(
              'A 4 digit OTP Code has been sent',
              style: GoogleFonts.ubuntu(color: Colors.grey),
            ),

            const SizedBox(
              height: 30,
            ),

            // otp box
            PinCodeTextField(
              appContext: context,
              length: 4,
              obscureText: false,
              animationType: AnimationType.fade,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              keyboardType: TextInputType.number,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(10),
                fieldHeight: 45,
                fieldWidth: 45,
                activeColor: Colors.white,
                inactiveFillColor: Colors.white,
                disabledColor: Colors.white,
                inactiveColor: primaryColor,
                selectedColor: Colors.white,
                selectedFillColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
