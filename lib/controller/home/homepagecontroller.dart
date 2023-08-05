import 'package:flutter/material.dart';
import 'package:foodninja/core/services/services.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/nameroutes.dart';
import '../../core/functions/handlingdata.dart';
import '../../data/datasource/reomte/homedata.dart';
import '../../data/datasource/reomte/itemsdata.dart';
import '../../data/modle/itemsmodle.dart';

abstract class HomepageController extends SearchController {
  initialData();
  getData();
  goItems(List categories, int selectedcat, String categoryid);
}

class HomepageControllerImp extends HomepageController {
  MyServices myServices = Get.find();
  String? username;
  String? id;
  HomeData homeData = HomeData(Get.find());
  List categories = [];
  List items = [];
  @override
  late StatusRequest statusRequest;

  @override
  getData() async {
    statusRequest = StatusRequest.loding;
    var response = await homeData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        categories.addAll(response["categories"]['data']);
        items.addAll(response["items"]['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
    search = TextEditingController();
  }

  @override
  void onInit() {
    initialData();
    getData();
    super.onInit();
  }

  @override
  goItems(categories, selectedcat, categoryid) {
    Get.toNamed(NameRoutes.items, arguments: {
      "categories": categories,
      "selectedcat": selectedcat,
      'categoryid': categoryid
    });
  }

  gotoProduct(itemsModle) {
    Get.toNamed(NameRoutes.product, arguments: {'itemsmodle': itemsModle});
  }
}

class SearchController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());
  List<ItemsModle> searchList = [];
  late StatusRequest statusRequest;
  TextEditingController? search;
  bool isSearch = false;
  checkSearch(val) {
    if (val == "") {
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    searchItems();
    update();
  }

  searchItems() async {
    statusRequest = StatusRequest.loding;
    var response = await itemsData.searchData(search!.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        searchList.clear();
        List responseData = response['data'];
        searchList.addAll(responseData.map((e) => ItemsModle.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
