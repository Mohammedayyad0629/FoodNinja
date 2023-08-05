import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../core/class/statusrequest.dart';
import '../core/constant/nameroutes.dart';
import '../core/functions/handlingdata.dart';
import '../core/services/services.dart';
import '../data/datasource/reomte/itemsdata.dart';
import 'home/homepagecontroller.dart';

abstract class ItemsController extends SearchController {
  intialData();
  changecat(int val, String catval);
  getItems(String categoryid);
  gotoProduct(itemsModle);
}

class ItemsControllerImp extends ItemsController {
  List categories = [];
  List items = [];
  String? categoryid;
  int? selectedcat;
  MyServices myServices = Get.find();
  ItemsData homeData = ItemsData(Get.find());
  @override
  late StatusRequest statusRequest;

  @override
  intialData() {
    categories = Get.arguments['categories'];
    selectedcat = Get.arguments['selectedcat'];
    categoryid = Get.arguments['categoryid'];
    getItems(categoryid!);
    search = TextEditingController();
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }

  @override
  changecat(int val, catval) {
    selectedcat = val;
    getItems(catval);
    update();
  }

  @override
  getItems(
    categoryid,
  ) async {
    items.clear();
    statusRequest = StatusRequest.loding;
    var response = await homeData.getData(
        categoryid, myServices.sharedPreferences.getString('id')!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        items.addAll(response["data"]);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  gotoProduct(itemsModle) {
    Get.toNamed(NameRoutes.product, arguments: {'itemsmodle': itemsModle});
  }
}
