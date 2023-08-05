import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/nameroutes.dart';
import '../../core/functions/handlingdata.dart';
import '../../data/datasource/reomte/auth/verificationcodedata.dart';

abstract class VerificationCodeEmailSignupController extends GetxController {
  verificationcode(String verificationCode);
}

class VerificationCodeEmailSignupControllerImp
    extends VerificationCodeEmailSignupController {
  VerificationData verificationData = VerificationData(Get.find());
  String? email;
  StatusRequest statusRequest = StatusRequest.none;

  @override
  verificationcode(String verificationCode) async {
    statusRequest = StatusRequest.loding;
    update();
    var response = await verificationData.postData(email!, verificationCode);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.toNamed(NameRoutes.signupsuccesful);
      } else {
        Get.defaultDialog(
            title: 'تحذير', middleText: "الكود الذي ادخلته خاطىء");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  reSend() {
    verificationData.resendData(
      email!,
    );
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
