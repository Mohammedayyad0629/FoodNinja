import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/constant/nameroutes.dart';
import '../core/functions/handlingdata.dart';
import '../core/services/services.dart';
import '../data/datasource/reomte/cartdata.dart';
import '../data/modle/cartmodle.dart';

class CartController extends GetxController {
  MyServices myServices = Get.find();
  CartData cartdata = CartData(Get.find());
  StatusRequest statusRequest = StatusRequest.loding;
  int quantity = 0;
  List<CartModle> cart = [];
  int totalitems = 0;
  double totalprice = 0.0;
  addCart(String itemsid) async {
    statusRequest = StatusRequest.loding;
    var response = await cartdata.cartAdd(
        myServices.sharedPreferences.getString('id')!, itemsid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  removeCart(String itemsid) async {
    statusRequest = StatusRequest.loding;
    var response = await cartdata.cartRemove(
        myServices.sharedPreferences.getString('id')!, itemsid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  removeAllCart(String itemsid) async {
    statusRequest = StatusRequest.loding;
    var response = await cartdata.cartRemoveAll(
        myServices.sharedPreferences.getString('id')!, itemsid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  viewCart() async {
    statusRequest = StatusRequest.loding;
    update();
    var response =
        await cartdata.cartView(myServices.sharedPreferences.getString('id')!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        if (response['datacart']['status'] == 'success') {
          cart.clear();
          List responsecart = response['datacart']['data'];
          cart.addAll(responsecart.map((e) => CartModle.fromJson(e)));
          Map responsecountprice = response['countprice'];
          totalitems = int.parse(responsecountprice['totalcount']);
          totalprice = double.parse(responsecountprice['totalprice']);
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  viewCart2() async {
    var response =
        await cartdata.cartView(myServices.sharedPreferences.getString('id')!);
    if (response['datacart']['status'] == 'success') {
      cart.clear();
      List responsecart = response['datacart']['data'];
      cart.addAll(responsecart.map((e) => CartModle.fromJson(e)));
      Map responsecountprice = response['countprice'];
      totalitems = int.parse(responsecountprice['totalcount']);
      totalprice = double.parse(responsecountprice['totalprice']);
    }
    update();
  }

  resetVarCart() {
    totalitems = 0;
    totalprice = 0.0;
    cart.clear();
  }

  refreshPage() {
    resetVarCart();
    viewCart();
  }

  gotocart() {
    viewCart();
    Get.toNamed(
      NameRoutes.cart,
    );
  }

  @override
  void onInit() {
    viewCart();
    super.onInit();
  }
}
