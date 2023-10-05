import 'package:demo/data/models/category_model.dart';
import 'package:demo/data/services/network_caller.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  bool _getCategoryInProgress = false;
  CategoryModel _categoryModel = CategoryModel();

  bool get getCategoryInProgress => _getCategoryInProgress;
  CategoryModel get categoryModel => _categoryModel;

  Future<bool> getCategories() async {
    _getCategoryInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(url: '/CategoryList');
    _getCategoryInProgress = false;
    if (response.isSuccess) {
      _categoryModel = CategoryModel.fromJson(response.returndata);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
