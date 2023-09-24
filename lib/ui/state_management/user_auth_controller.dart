import 'package:demo/data/services/network_caller.dart';
import 'package:get/get.dart';

class UserAuthController extends GetxController {
  bool _emailVerificationProgress = false;
  bool _otpVerificationProgress = false;

  bool get emailVerificationProgress => _emailVerificationProgress;
  bool get otpVerificationProgress => _otpVerificationProgress;

  // email verification controller
  Future<bool> emailVerification(String email) async {
    _emailVerificationProgress = true;
    update();
    final response = await NetworkCaller.getRequest(url: '/UserLogin/$email');
    _emailVerificationProgress = false;
    if (response.isSuccess) {
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

  // OTP verification controller
  Future<bool> otpVerification(String email, String otp) async {
    _otpVerificationProgress = true;
    update();
    final response =
        await NetworkCaller.getRequest(url: '/VerifyLogin/$email/$otp');
    _otpVerificationProgress = false;
    if (response.isSuccess) {
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
