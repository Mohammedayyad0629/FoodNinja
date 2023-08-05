import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:foodninja/core/constant/imageasset.dart';
import 'package:foodninja/core/services/services.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/nameroutes.dart';
import '../../core/functions/handlingdata.dart';
import '../../data/datasource/reomte/auth/logindata.dart';

abstract class LogInController extends GetxController {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  login();
  forgetpassword();
}

class LogInControllerImp extends LogInController {
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  LoginData loginData = LoginData(Get.find());
  bool isshowpassword = true;
  String eyeicon = ImageAsset.eyeicondark;

  isshow() {
    if (isshowpassword == true) {
      isshowpassword = false;
      eyeicon = ImageAsset.eyeiconlight;
      update();
    } else {
      isshowpassword = true;
      eyeicon = ImageAsset.eyeicondark;
      update();
    }
  }

  @override
  login() async {
    var formdata = key.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loding;
      update();
      var response = await loginData.postData(email.text, password.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          if (response['data']['users_approve'] == '1') {
            myServices.sharedPreferences
                .setString("id", response['data']['users_id']);
            myServices.sharedPreferences
                .setString("username", response['data']['users_name']);
            myServices.sharedPreferences
                .setString("phone", response['data']['users_phone']);
            myServices.sharedPreferences
                .setString("email", response['data']['users_email']);
            myServices.sharedPreferences.setString("step", "2");
            Get.offNamed(
              NameRoutes.homescreen,
            );
          } else {
            Get.offNamed(NameRoutes.verificationsignup,
                arguments: {"email": email.text});
          }
        } else {
          Get.defaultDialog(
              title: "تحذير", middleText: 'الايميل غير موجود سابقا');
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  forgetpassword() {
    Get.toNamed(NameRoutes.forgetpassword);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {});
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
