import 'package:demo/data/models/profile_model.dart';
import 'package:demo/ui/state_management/auth_controller.dart';
import 'package:get/get.dart';

import '../../data/services/network_caller.dart';

class UserProfileContoller extends GetxController {
  bool _getProfileDataInProgress = false;

  bool get getProfileDataInProgress => _getProfileDataInProgress;

  Future<bool> getProfileData() async {
    _getProfileDataInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(url: '/ReadProfile');
    _getProfileDataInProgress = false;
    if (response.isSuccess) {
      final ProfileModel profileModel =
          ProfileModel.fromJson(response.returndata);
      if (profileModel.data != null) {
        Get.find<AuthController>()
            .saveProfileData(profileModel.data!.firstName as ProfileData);
      }
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
