import 'package:demo/utils/app_colors.dart';
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
              logoimgPath,
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
            const SizedBox(
              height: 10,
            ),
            Text(
              'A 4 digit OTP Code has been sent',
              style: GoogleFonts.ubuntu(color: greyColor),
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
              // animationDuration: const Duration(seconds: 3),
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              keyboardType: TextInputType.number,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(10),
                fieldHeight: 45,
                fieldWidth: 45,
                activeFillColor: primaryColor,
                activeColor: primaryColor,
                inactiveFillColor: Colors.white,
                disabledColor: Colors.white,
                inactiveColor: primaryColor,
                selectedColor: Colors.black,
                selectedFillColor: Colors.white,
              ),
              enableActiveFill: true,
              onCompleted: (v) {},
              onChanged: (value) {},
            ),
            const SizedBox(
              height: 30,
            ),

            //button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Next'),
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            // text
            RichText(
              text: const TextSpan(
                  text: 'This code will expire in ',
                  style: TextStyle(fontSize: 13, color: greyColor),
                  children: [
                    TextSpan(
                        text: '120s',
                        style: TextStyle(
                            fontSize: 13,
                            color: primaryColor,
                            fontWeight: FontWeight.bold))
                  ]),
            ),

            // text button
            TextButton(
                onPressed: () {},
                child: Text(
                  'Resend Code',
                  style: GoogleFonts.ubuntu(color: greyColor.withOpacity(.9)),
                ))
          ],
        ),
      ),
    );
  }
}
