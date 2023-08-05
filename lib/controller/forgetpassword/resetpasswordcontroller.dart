import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/constant/imageasset.dart';
import '../../../core/constant/nameroutes.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdata.dart';
import '../../data/datasource/reomte/forgetpassword/resetpassword.dart';

abstract class ResetPasswordController extends GetxController {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  late TextEditingController newpassword;
  late TextEditingController againnewpassword;

  resetpassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  StatusRequest statusRequest = StatusRequest.none ;
  String? email;
  ResetPassword resetPassword = ResetPassword(Get.find());
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
  resetpassword() async {
    if (newpassword.text != againnewpassword.text) {
      Get.defaultDialog(
          title: "warning", middleText: "Password Not Match");
    }else if (key.currentState!.validate()) {
      statusRequest = StatusRequest.loding;
      update();
      var response = await resetPassword.resetkData(email!, newpassword.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.toNamed(NameRoutes.passwordresetsuccesful);
        } else {
          Get.defaultDialog(
              title: "ُWarning", middleText: "Try Again");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
    }
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    newpassword = TextEditingController();
    againnewpassword = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    newpassword.dispose();
    againnewpassword.dispose();
    super.dispose();
  }
}
