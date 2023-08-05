import 'package:flutter/cupertino.dart';
import 'package:foodninja/core/class/statusrequest.dart';
import 'package:get/get.dart';

import '../../core/constant/imageasset.dart';
import '../../core/constant/nameroutes.dart';
import '../../core/functions/handlingdata.dart';
import '../../data/datasource/reomte/auth/signupdata.dart';

abstract class SignUpController extends GetxController {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  late TextEditingController email ;
  late TextEditingController username ;
  late TextEditingController phone ;
  late TextEditingController password ;
  StatusRequest statusRequest = StatusRequest.none ;
  SignupData signupData = SignupData(Get.find());
  List data =[];
  signup();
}
class SignUpControllerImp extends SignUpController {
  bool isshowpassword = true ;
  String eyeicon = ImageAsset.eyeicondark;

  isshow() {
    if(isshowpassword == true){
      isshowpassword = false ;
      eyeicon = ImageAsset.eyeiconlight;
      update();
    }else{
      isshowpassword = true ;
      eyeicon = ImageAsset.eyeicondark;
      update();
    }
  }
  @override
  signup()async {
    var formdata = key.currentState ;
    if(formdata !.validate()){
      statusRequest= StatusRequest.loding ;
      update();
    var response = await signupData.postData(username.text, email.text, phone.text, password.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest){
      if (response['status'] == 'success'){
        // data.addAll(response[data]);
      Get.offNamed(NameRoutes.verificationsignup , arguments:  {
        "email" : email.text
      });
      }else {
        Get.defaultDialog(title: "تحذير" , middleText: 'الايميل موجود سابقا');
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
    password =TextEditingController();
    username =TextEditingController();
    phone =TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    username.dispose();
    phone.dispose();
    super.dispose();
  }
} 