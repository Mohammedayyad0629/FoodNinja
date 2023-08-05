import 'package:foodninja/core/constant/nameroutes.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/services.dart';
import '../../data/datasource/reomte/favorite/favoritedata.dart';

class FavoriteController extends GetxController {
  Map isFavorite = {};
  FavoriteData favoritedata = FavoriteData(Get.find());
  List data = [];
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  favoriteAdd(String itemsid) async {
    statusRequest = StatusRequest.loding;
    var response = await favoritedata.favoriteAdd(
        myServices.sharedPreferences.getString('id')!, itemsid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.offAllNamed(NameRoutes.homescreen);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  favoriteRemove(String itemsid) async {
    statusRequest = StatusRequest.loding;
    var response = await favoritedata.favoriteRemove(
        myServices.sharedPreferences.getString('id')!, itemsid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.snackbar('تنبيه !', "تم ازالة المنتج من المفضلة بنجاح");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }
}
