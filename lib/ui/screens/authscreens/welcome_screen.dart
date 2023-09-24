import 'package:demo/ui/screens/authscreens/otp_screen.dart';
import 'package:demo/ui/state_management/user_auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors.dart';
import '../../widgets/home/common_text_field.dart';

class WelcomeBackScreen extends StatefulWidget {
  const WelcomeBackScreen({super.key});

  @override
  State<WelcomeBackScreen> createState() => _WelcomeBackScreenState();
}

class _WelcomeBackScreenState extends State<WelcomeBackScreen> {
  final TextEditingController _emailETController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<UserAuthController>(builder: (authController) {
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: Form(
              key: _globalKey,
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
                    textEditingController: _emailETController,
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // button

                  authController.emailVerificationProgress
                      ? const CircularProgressIndicator()
                      : SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              // validate email controller
                              if (_globalKey.currentState!.validate()) {
                                // email verification check
                                final bool response = await authController
                                    .emailVerification(_emailETController.text);
                                if (response) {
                                  Get.to(() => OTPscreen(
                                        email: _emailETController.text,
                                      ));
                                } else {
                                  // when you're using getx you don't have to use context
                                  // so you don't need to use if(mounted)
                                  // if (mounted) {
                                  //   Get.snackbar('Login Failed', 'Try again',
                                  //       backgroundColor: Colors.red);
                                  // }
                                  Get.snackbar('Login Failed', 'Try again',
                                      backgroundColor: Colors.red);
                                }
                              }
                            },
                            child: const Text('Next'),
                          ),
                        ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
