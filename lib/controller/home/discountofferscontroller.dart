import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/services/services.dart';

abstract class DiscountOffersController extends GetxController {
  next();
}

class DiscountOffersControllerImp extends DiscountOffersController {
  int currentpage = 0;
  late PageController pagecontroller;
  MyServices myServices = Get.find();
  @override
  next() {
    currentpage++;
  }

  @override
  void onInit() {
    pagecontroller = PageController();
    super.onInit();
  }
}
