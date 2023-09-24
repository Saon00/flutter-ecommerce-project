import 'package:demo/data/services/network_caller.dart';
import 'package:get/get.dart';

class UserAuthController extends GetxController {
  bool _emailVerificationProgress = false;

  bool get emailVerificationProgress => _emailVerificationProgress;

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
}
