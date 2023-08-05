import 'package:flutter/cupertino.dart';
import 'package:foodninja/core/constant/nameroutes.dart';
import 'package:foodninja/core/services/services.dart';
import 'package:foodninja/data/datasource/static/onbordingstatic.dart';
import 'package:get/get.dart';

abstract class OnbordingController extends GetxController {
  next();
  dotenchanged(int index);
}

class OnbordingControllerImp extends OnbordingController {
  int currentpage = 0;
  late PageController pagecontroller;
  @override
  dotenchanged(int index) {
    currentpage = index;
    update();
  }

  MyServices myServices = Get.find();
  @override
  next() {
    currentpage++;
    if (currentpage > onbordinglist.length - 1) {
      myServices.sharedPreferences.setString('step', "1");
      Get.offAllNamed(NameRoutes.login);
    } else {
      pagecontroller.animateToPage(currentpage,
          duration: const Duration(milliseconds: 600), curve: Curves.linear);
    }
  }

  @override
  void onInit() {
    pagecontroller = PageController();
    super.onInit();
  }
}
