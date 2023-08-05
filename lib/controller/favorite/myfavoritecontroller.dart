import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/services.dart';
import '../../data/datasource/reomte/favorite/myfavoritedate.dart';
import '../../data/modle/myfavoritemodle.dart';

class MyFavoriteController extends GetxController {
  MyFavoriteDate myfavoritedata = MyFavoriteDate(Get.find());
  List<MyFavoriteModle> myFavorite = [];
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;

  favoriteView() async {
    statusRequest = StatusRequest.loding;
    var response = await myfavoritedata.getData(
      myServices.sharedPreferences.getString('id')!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        myFavorite.addAll(responseData.map((e) => MyFavoriteModle.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteFavorite(String favoriteId) async {
    statusRequest = StatusRequest.loding;
    var response = await myfavoritedata.deletData(
      favoriteId,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        myFavorite.removeWhere((element) => element.favoriteId == favoriteId);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    favoriteView();
  }
}
