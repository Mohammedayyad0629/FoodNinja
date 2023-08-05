import 'package:foodninja/data/modle/itemsmodle.dart';
import 'package:get/get.dart';
import '../core/class/statusrequest.dart';
import '../core/functions/handlingdata.dart';
import '../core/services/services.dart';
import '../data/datasource/reomte/cartdata.dart';
import '../data/datasource/reomte/favorite/favoritedata.dart';

abstract class ProductController extends GetxController {}

class ProductControllerImp extends ProductController {
  CartData cartdata = CartData(Get.find());
  int quantity = 0;
  Map isFavorite = {};
  FavoriteData favoritedata = FavoriteData(Get.find());
  List data = [];
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  late ItemsModle itemsModle;

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
        Get.snackbar('تنبيه !', "تم اضافة المنتج للمفضلة بنجاح");
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

  countItemsCart(String itemsid) async {
    statusRequest = StatusRequest.loding;
    var response = await cartdata.cartGetCountItems(
        myServices.sharedPreferences.getString('id')!, itemsid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        int quantityItems = 0;
        quantityItems = int.parse(response['data']);
        return quantityItems;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  add() {
    quantity++;
    update();
  }

  remove() {
    if (quantity > 0) {
      quantity--;
    }
    update();
  }

  initialData() async {
    statusRequest = StatusRequest.loding;
    itemsModle = Get.arguments['itemsmodle'];
    quantity = await countItemsCart(itemsModle.itemsId!);
    statusRequest = StatusRequest.success;
    update();
  }

  refreshPage() async {
    statusRequest = StatusRequest.loding;
    quantity = await countItemsCart(itemsModle.itemsId!);
    statusRequest = StatusRequest.success;
    update();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
