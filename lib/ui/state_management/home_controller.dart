import 'package:demo/data/models/home_slider_model.dart';
import 'package:demo/data/services/network_caller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  bool _getSliderInProgress = false;
  HomeSliderModel _homeSliderModel = HomeSliderModel();

  HomeSliderModel get homeSliderModel => _homeSliderModel;
  bool get getSliderInProgress => _getSliderInProgress;

  Future<bool> getHomeSlider() async {
    _getSliderInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(url: '/ListProductSlider');
    _getSliderInProgress = false;
    if (response.isSuccess) {
      _homeSliderModel = HomeSliderModel.fromJson(response.returndata);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
