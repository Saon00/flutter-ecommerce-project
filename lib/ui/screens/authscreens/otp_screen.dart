import 'package:demo/ui/screens/homescreens/home_screen.dart';
import 'package:demo/ui/state_management/user_auth_controller.dart';
import 'package:demo/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPscreen extends StatefulWidget {
  final String email;
  const OTPscreen({super.key, required this.email});

  @override
  State<OTPscreen> createState() => _OTPscreenState();
}

class _OTPscreenState extends State<OTPscreen> {
  final TextEditingController _otpcontroller = TextEditingController();
  final GlobalKey<FormState> _otpkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<UserAuthController>(builder: (userAuthController) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _otpkey,
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
                  controller: _otpcontroller,
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
                  // need to customized
                  onCompleted: (String? v) {
                    if (v?.isEmpty ?? true) {}
                    return;
                  },
                  onChanged: (value) {},
                ),
                const SizedBox(
                  height: 30,
                ),

                //button
                userAuthController.otpVerificationProgress
                    ? const CircularProgressIndicator()
                    : SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            final bool response =
                                await userAuthController.otpVerification(
                                    widget.email, _otpcontroller.text);

                            if (response) {
                              Get.to(() => const HomeScreen());
                            } else {
                              Get.snackbar(
                                  'OTP Verification Failed', 'Try again',
                                  backgroundColor: Colors.red);
                            }
                          },
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
                      style:
                          GoogleFonts.ubuntu(color: greyColor.withOpacity(.9)),
                    ))
              ],
            ),
          ),
        );
      }),
    );
  }
}
