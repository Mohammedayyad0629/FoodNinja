import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/constant/nameroutes.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdata.dart';
import '../../data/datasource/reomte/forgetpassword/checkemail.dart';

abstract class ForgetPasswordController extends GetxController {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  late TextEditingController email ;

  forgetpassword();
}
class ForgetPasswordControllerImp extends ForgetPasswordController {
    StatusRequest statusRequest = StatusRequest.none ;
    CheckEmail checkEmail = CheckEmail(Get.find());
  @override
  forgetpassword() async {
    var formdata = key.currentState ;
    if(formdata !.validate()){
    statusRequest = StatusRequest.none ;
      update();
    var response = await checkEmail.checkData( email.text,);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest){
      if (response['status'] == 'success'){
          Get.toNamed(NameRoutes.verificationcode , arguments: {
            'email' : email.text
          });
      }else {
        Get.defaultDialog(title: "Error" , middleText: 'Email does not exist before');
        statusRequest = StatusRequest.failure ;
      }
    }
    update();
    }else{
    }
  }
  @override
  void onInit() {
    email =TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
  

} 