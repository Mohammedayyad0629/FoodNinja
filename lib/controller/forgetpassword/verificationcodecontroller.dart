import 'package:foodninja/core/class/statusrequest.dart';
import 'package:get/get.dart';

import '../../../core/constant/nameroutes.dart';
import '../../../core/functions/handlingdata.dart';
import '../../data/datasource/reomte/forgetpassword/verifycode.dart';

abstract class VerificationCodeController extends GetxController {
  verificationcode(String verifycode);
}

class VerificationCodeControllerImp extends VerificationCodeController {
  VerifyCodeForget verifyCodeForget = VerifyCodeForget(Get.find());
  String? email;
  StatusRequest statusRequest = StatusRequest.none;

  @override
  verificationcode(verifycode) async {
    statusRequest = StatusRequest.loding;
    update();
    var response = await verifyCodeForget.checkCode(email!, verifycode);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        // data.addAll(response[data]);
        Get.toNamed(NameRoutes.resetpassword, arguments: {'email': email});
      } else {
        Get.defaultDialog(
            title: "Error", middleText: 'The code you entered is wrong');
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
