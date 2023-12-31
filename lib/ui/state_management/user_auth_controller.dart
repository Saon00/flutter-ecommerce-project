import 'package:demo/data/services/network_caller.dart';
import 'package:demo/ui/state_management/auth_controller.dart';
import 'package:demo/ui/state_management/user_profile_controller.dart';
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
      // 'data' from postman
      await Get.find<AuthController>().saveToken(response.returndata['data']);
      Get.find<UserProfileContoller>().getProfileData();
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
